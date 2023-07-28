require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、kanji_fist_name、kanji_last_name、kana_first_name、kana_last_name、bithday_yyyy、bithday_mm、bithday_ddが存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailに@がないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが6文字未満では登録できない' do
      end
      it 'パスワードは、英字のみ又は数字のみでは登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'kanji_fist_name又はkanji_last_nameが空では登録できない' do
      end
      it 'kanji_fist_name又はkanji_last_nameが全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
      end
      it 'kana_first_name又はkana_last_nameが空では登録できない' do
      end
      it 'kana_first_name又はkana_last_nameが全角（カタカナ）でない場合は登録できない' do
      end
      it 'bithday_yyyy、bithday_mm、bithday_ddのいずれかが空の場合は登録できない' do
      end
    end
  end
end
