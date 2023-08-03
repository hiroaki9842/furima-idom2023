class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,                 presence: true
  validates :item_name,             presence: true, length: {maximum: 40 } 
  validates :item_summary ,         presence: true, length: {maximum: 1000 }
  validates :item_category_id ,     presence: true, numericality: {other_than: 1}
  validates :item_condition_id ,    presence: true, numericality: {other_than: 1}
  validates :shipping_cost_id ,     presence: true, numericality: {other_than: 1}
  validates :prefecture_id ,        presence: true, numericality: {other_than: 1}
  validates :day_to_shipment_id ,   presence: true, numericality: {other_than: 1}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :day_to_shipment

  #価格は全て半角かつ整数
  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end      
end