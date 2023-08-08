class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code,:prefecture_id,:mailing_address,:house_number,:building_name,:phone_number,
                :user_id,:item_id

#addressモデルのバリデーション
  validates :post_code, presence: true, format:{with: /\A\d{3}[-]\d{4}\z/}
  validates :phon_number, presence: true, format:{with: /\A\d{10,11}\z/}

#orderとaddressへのデータ保存
  def save
    order = Order.create(user_id: current_user.id, item_id: @item.id)
    Address.create(post_code:post_code,prefecture_id:prefecture_id,mailing_address:mailing_address,house_number:house_number,building_name:building_name,phone_number:phone_number,order_id:order.id)
  end
end