class ShoppingsController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @shopping_form = ShoppingForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @shopping_form = ShoppingForm.new(shopping_form_params)
    if @shopping_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: shopping_form_params[:token],
        currency: 'jpy'
      )
      @shopping_form.save(params,current_user.id)
      return  redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def shopping_form_params
    params.require(:shopping_form).permit(:token,:user_id, :item_id, :post_code, :building_name, :shipping_from_id, :municipality, :street_address, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
end
