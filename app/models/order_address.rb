class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:mailing_address,:house_number,:building_name,:phone_number,:user_id,:item_id,:token,:price

#addressモデルのバリデーション
with_options presence: true do
  validates  :post_code,      format:{with: /\A\d{3}[-]\d{4}\z/}
  validates  :phone_number,   format:{with: /\A\d{10,11}\z/}
  validates  :user_id
end

#orderとaddressへのデータ保存
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, mailing_address: mailing_address, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end