class ShoppingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:create, :index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @shopping_form = ShoppingForm.new
    redirect_to root_path if @item.user_id == current_user.id
    if @item.shopping.present?
      redirect_to root_path 
    end
  end

  def create
    @shopping_form = ShoppingForm.new(shopping_form_params)
    if @shopping_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: shopping_form_params[:token],
        currency: 'jpy'
      )
      @shopping_form.save(params,current_user.id)
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def shopping_form_params
    params.require(:shopping_form).permit(:token,:user_id, :item_id, :post_code, :building_name, :shipping_from_id, :municipality, :street_address, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
