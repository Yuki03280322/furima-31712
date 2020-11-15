require 'rails_helper'
RSpec.describe ItemBuy, type: :model do
  before do
    @item_buy = FactoryBot.build(:item_buy)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'builing_name以外の全ての項目が存在すれば購入できる' do
        expect(@item_buy).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @item_buy.token = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと購入できない' do
        @item_buy.postal_code = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'cityが空だと購入できない' do
        @item_buy.city = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("City can't be blank")
      end

      it 'street_numberが空だと購入できない' do
        @item_buy.street_number = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Street number can't be blank")
      end

      it 'telephoneが空だと購入できない' do
        @item_buy.telephone = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'prefecture_idが1だと購入できない' do
        @item_buy.prefecture_id = 1
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'postal_codeにハイフンが含まれていないと購入できない' do
        @item_buy.postal_code = 1_111_111
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Postal code is invalid')
      end

      it 'telephoneにハイフンが含まれていると購入できない' do
        @item_buy.telephone = 0o00 - 0o000 - 0o000
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Telephone is invalid')
      end

      it 'telephoneの桁数が12桁以上だと購入できない' do
        @item_buy.telephone = 0o00000000000
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Telephone is invalid')
      end
    end
  end
end
