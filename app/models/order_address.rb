class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:mailing_address,:house_number,:building_name,:phone_number,:user_id,:item_id,:token,:price

#addressモデルのバリデーション
  validates  :token, presence: true
  validates  :post_code,      format:{with: /\A\d{3}[-]\d{4}\z/}
  validates  :post_code,     presence: true,  format:{with: /\A\d{3}[-]\d{4}\z/,message: "Enter it as follows (e.g. 123-4567)"}
  validates  :prefecture_id,  presence: true,  numericality: { other_than: 1 }
  validates  :mailing_address, presence: true
  validates  :house_number, presence: true
  validates  :phone_number,    presence: true, format:{with: /\A[0-9]+\z/,message:'Input only half-width number'},length:{in:10..11}
  validates  :user_id ,presence: true
  validates  :item_id , presence: true
  


#orderとaddressへのデータ保存
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, mailing_address: mailing_address, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end