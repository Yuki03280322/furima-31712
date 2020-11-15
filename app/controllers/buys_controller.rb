class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_id
  before_action :move_to_root_path
  before_action :soldout_block

  def index
    @item_buy = ItemBuy.new
  end

  def create
    @item_buy = ItemBuy.new(buy_params)
    if @item_buy.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
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

  def set_id
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == @item.user_id
  end

  def soldout_block
    redirect_to root_path if @item.buy.present?
  end
end
