require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep(0.2)
    #"sleep(0.2)"を設定し読み込みタイミングを遅くずらしている。早すぎてactive_hashを読み込む前に処理が進みエラーになるから。
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'post_code、prefecture_id、mailing_address、house_number、phone_number、building_name、tokenが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも、post_code、prefecture_id、mailing_address、house_number、phone_number、tokenが存在すれば登録できる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
	it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

	it 'post_codeが3桁(-)4桁以外では登録できない' do
        @order_address.post_code = '1234-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end

      it 'post_codeは(-)を含まないと登録できない' do
        @order_address.post_code = '1231234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end

      it 'post_codeは半角数値でないと登録できない' do
        @order_address.post_code = '12３1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end

	    it 'prefecture_id  が[---]では登録できない' do
        @order_address.prefecture_id  = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'mailing_address が空では登録できない' do
        @order_address.mailing_address  = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Mailing address can't be blank")
      end

      it 'house_numberrが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは9桁以下では登録できない' do
        @order_address.phone_number = '012345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it 'phone_numberは12桁以上では登録できない' do
        @order_address.phone_number = '012345678901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it ' phone_numberは半角数字以外が含まれている場合は購入できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @order_address.phone_number = '0123４567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only half-width number")
      end
      
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end  

      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end  
    end
  end
end