require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "price,name,explanation,prefecture_id,category_id,condition_id,postage_id,ahipping_date_id,imageが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "nameが空だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "explanationが空だと出品できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "prefecture_idが1だと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "category_idが1だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "condition_idが1だと出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "postage_idが1だと出品できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it "shipping_date_idが1だと出品できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end

      it "priceの値が¥299以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceの値が¥10,000,000以上だと出品できない" do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceの値が半角数字以外を使用した場合、出品できない" do
        @item.price = "eee"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceの値が半角数字以外を使用した場合、出品できない" do
        @item.price = "３３３"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
    
  end
end
