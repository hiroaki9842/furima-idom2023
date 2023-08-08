class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]

  def index
      @item = Item.find(params[:item_id])
      if user_signed_in? && current_user.id == @item.user_id
        redirect_to root_path
      end
      @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
      if  @order_address.valid?
          @order_address.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code,:prefecture_id,:mailing_address,:house_number,:building_name,:phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end
end
