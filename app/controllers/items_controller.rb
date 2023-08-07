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

  def edit
    @item = Item.find(params[:id])
    if current_user != @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_summary, :item_category_id, :item_condition_id, :shipping_cost_id,
                                 :prefecture_id, :day_to_shipment_id, :price)
          .merge(user_id: current_user.id)
  end
end
