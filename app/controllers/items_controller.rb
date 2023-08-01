class ItemsController < ApplicationController
  def index
  end

  def new
    @category = Category.all
    @condition = Condition.all
    @shipping_cost = ShippingCost.all
    @prefecture = Prefecture.all
    @day_to_shipment = DayToShipment.all
  end

end
