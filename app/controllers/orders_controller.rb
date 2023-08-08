class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]

  def index
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
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
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
        Payjp::Charge.create(
          amount: order_params[:price],  # 商品の値段
          card: order_params[:token],         # カードトークン
          currency: 'jpy'                     # 通貨の種類（日本円）
        )
          @order_address.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code,:prefecture_id,:mailing_address,:house_number,:building_name,:phone_number,:token).merge(item_id: @item.id, user_id: current_user.id,token:params[:token],price: @item.price)
  end
end
