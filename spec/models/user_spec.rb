require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nick_nameとemail、passwordとpassword_confirmation、kanji_fist_name、kanji_last_name、kana_first_name、kana_last_name、bithday_yyyy、bithday_mm、bithday_ddが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef' # password_confirmationを追加し、一致するようにする
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456' # password_confirmationを追加し、一致するようにする
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数を両方含む必要があります")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '222aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'kanji_first_nameが空では登録できない' do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first name 全角文字を使用してください')
      end
      it 'kanji_last_nameが空では登録できない' do
        @user.kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name 全角文字を使用してください")
      end
      it 'kanji_first_nameが全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
        @user.kanji_first_name = 'satomi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first name 全角文字を使用してください')#エラー文言追加7/31
      end
      it 'kanji_last_nameが全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
        @user.kanji_last_name = 'ishihara'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji last name 全角文字を使用してください')#エラー文言追加7/31
      end
      it 'kana_first_name又はkana_last_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name 全角カタカナを使用してください")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name 全角カタカナを使用してください")
      end
      it 'kana_first_nameが全角（カタカナ）でない場合は登録できない' do
        @user.kana_first_name = 'さとみ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name 全角カタカナを使用してください')
      end
      it 'kana_last_nameが全角（カタカナ）でない場合は登録できない' do
        @user.kana_last_name = '石原'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name 全角カタカナを使用してください")
      end
      it 'birthday_yyyy_mm_ddが空の場合は登録できない' do
        @user.birthday_yyyy_mm_dd = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday yyyy mm dd can't be blank")
      end
    end
  end
end
