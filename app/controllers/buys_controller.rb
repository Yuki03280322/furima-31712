class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_buy = ItemBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_buy = ItemBuy.new(buy_params)
    @item_buy.save
    if @item_buy.valid?
      @item_buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def buy_params
    params.permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :telephone, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
