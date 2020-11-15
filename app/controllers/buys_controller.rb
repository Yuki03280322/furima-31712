class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_buy = ItemBuy.new
  end

  def create
  end

end
