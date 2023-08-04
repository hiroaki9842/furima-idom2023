class DayToShipment < ActiveHash::Base
  self.data = [
    # 出品機能時の発送までの日数
    { id: 1, name: '---' },
    { id: 2, name: '1~2で発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '4~7日で発送' }
  ]
  include ActiveHash::Associations
  has_many :items
end
