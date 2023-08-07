class ItemsController < ApplicationController
  # ログイン状態の確認
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
    @condition = Condition.find(@item.item_condition_id).name
    @category = Category.find(@item.item_category_id).name
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == @item.user_id
      item.destroy
    end
      redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_summary, :item_category_id, :item_condition_id, :shipping_cost_id,
                                 :prefecture_id, :day_to_shipment_id, :price)
          .merge(user_id: current_user.id)
  end
end
