class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:destroy]
  before_action :set_item, only:[:show,:edit,:update,:destroy]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if current_user.nil?
      redirect_to new_user_session_path
    else
      redirect_to root_path unless @item.user == current_user
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user == current_user
    @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :condition_id, :shipping_fee_burden_id, :shipping_from_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
