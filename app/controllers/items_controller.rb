class ItemsController < ApplicationController
  #before_action :authenticate_user!, except: :index
  #def index
    #@items = Item.all.order("created_at DESC")
  #end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end
end
