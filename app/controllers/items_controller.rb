class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :redirect_to_root, except: [:index, :show, :new, :create]
  before_action :redirect_to_rootpath, only: [:edit, :update]
  before_action :call, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all.order("created_at DESC")
  end

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

  def show
  end

  def edit
  end

  def update
    if
      @item.update(item_params)

      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to "/"
     else
      redirect_to "/"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end

  def redirect_to_root
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def call
    @item = Item.find(params[:id])
  end

  def redirect_to_rootpath
    @item = Item.find(params[:id])
    if @item.buy_history.present?
      redirect_to root_path
    end
  end

end
