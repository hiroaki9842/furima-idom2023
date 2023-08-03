    FactoryBot.define do
      factory :item do
          association :user 
    
          item_name             {'二郎ラーメン'}
          item_summary          {'美味しい'}
          item_category_id      {'2'}
          item_condition_id     {'2'}
          shipping_cost_id      {'2'}
          prefecture_id         {'2'}
          day_to_shipment_id    {'2'}
          price                 {'850'}
  
          after(:build) do |item|
            item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
          end
      end
    end
