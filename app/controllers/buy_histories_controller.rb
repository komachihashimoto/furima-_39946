class BuyHistoriesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :redirect_to_root_path, only: [:new, :create]
  
  def index
  end

  def new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_history_address = BuyHistoryAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_history_address = BuyHistoryAddress.new(buy_history_params)
    @item = Item.find(params[:item_id])
    if @buy_history_address.valid?
      pay_item
      @buy_history_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'new', status: :unprocessable_entity
    end
  end

  private


  def buy_history_params
    params.require(:buy_history_address).permit(:zip_code, :prefecture_id, :city, :address_line1, :address_line2, :tel, :user_id, :item_id, :token, :buy_history_id ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: buy_history_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_to_root_path
    @item = Item.find(params[:item_id])
    if @item.buy_history.present? || user_session == current_user
      redirect_to root_path
    end
  end
end
