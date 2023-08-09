require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'userが紐付いていなければ購入できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end    
    end
  end
end