class Address < ApplicationRecord
  has_one_active_hash :prefecture_id
  belongs_to :order

  # validates :post_code, presence: true, format:{with: /\A\d{3}[-]\d{4}\z/}
  # validates :phon_number, presence: true, format:{with: /\A\d{10,11}\z/}
end
