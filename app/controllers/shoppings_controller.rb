class ShoppingsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @shopping_form = ShoppingForm.new
  end

  def create
    @shopping_form = ShoppingForm.new(shopping_form_params)
    if @shopping_form.valid?

      @shopping_form.save(params,current_user.id)
      return  redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def shopping_form_params
    params.require(:shopping_form).permit(:user_id, :item_id, :post_code, :building_name, :shipping_from_id, :municipality, :street_address, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
