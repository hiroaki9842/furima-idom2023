class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :item
  belongs_to :user
  has_one :address

  def sold_out
    @order = Order.where(:item_id)
  end
end
