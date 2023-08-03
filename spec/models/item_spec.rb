require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
  describe '商品登録' do
    context '商品登録できるとき' do
      it 'user_idとitem_name、item_summaryとitem_category_id、item_condition_id、shipping_cost_id、prefecture_id、day_to_shipment、price が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
        it '画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空では登録できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it '名前は41文字以上だと登録できない' do
          @item.item_name = "私の名前は三田二郎です私の名前は三田二郎です私の名前は三田二郎です私の名前は三田二郎です"
          @item.valid?  
          expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
        end
        
        it '商品説明が空では登録できない' do
          @item.item_summary = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item summary can't be blank")
        end

        it'商品説明は1001文字以上は登録できない' do
          @item.item_summary =
        "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Item summary is too long (maximum is 1000 characters)")
        end

        it '金額が300円未満だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '金額が100,000,000円以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it 'カテゴリーが空だと出品ができない'do
          @item.item_category_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Item category must be other than 1")
        end
        it '商品状態が空だと出品ができない' do
          @item.item_condition_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition must be other than 1")
        end
        it '配送料が空だと出品ができない' do
          @item.shipping_cost_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
        end
        it'配送元地域が空だと出品ができない' do
          @item.prefecture_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it '発送日数が空だと出品ができない' do
          @item.day_to_shipment_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include("Day to shipment must be other than 1")
        end
      end
  end
end