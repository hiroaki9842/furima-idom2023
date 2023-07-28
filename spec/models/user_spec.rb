require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、kanji_fist_name、kanji_last_name、kana_first_name、kana_last_name、bithday_yyyy、bithday_mm、bithday_ddが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
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
        except(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、英字のみ又は数字のみでは登録できない' do
        @user.password = '111111111'
        @user.valid?
        except(@user.errors.full_messages).to include('内容が分からないので調査必要')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '222aaa'
        @user.valid?
        except(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'kanji_fist_nameが空では登録できない' do
        @user.kanji_fist_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji_fist_name can't be blank")
      end
      it 'kanji_last_nameが空では登録できない' do
        @user.kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji_last_name can't be blank")
      end
      it 'kanji_fist_nameが全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
        @user.kanji_fist_name = 'satomi'
        @user.valid?
        except(@user.errors.full_messages).to include('内容が分からないので調査必要')
      end
      it 'kanji_last_nameが全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
        @user.kanji_last_name = 'ishihara'
        @user.valid?
        except(@user.errors.full_messages).to include('内容が分からないので調査必要')
      end
      it 'kana_first_name又はkana_last_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana_first_name can't be blank")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana_last_name can't be blank")
      end
      it 'kana_first_nameが全角（カタカナ）でない場合は登録できない' do
        @user.kana_first_name = 'さとみ'
        @user.valid?
        except(@user.errors.full_messages).to include('内容が分からないので調査必要')
      end
      it 'kana_last_nameが全角（カタカナ）でない場合は登録できない' do
        @user.kana_last_name = '石原'
        @user.valid?
        except(@user.errors.full_messages).to include('内容が分からないので調査必要')
      end
      it 'bithday_yyyyが空の場合は登録できない' do
        @user.bithday_yyyy = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Bithday_yyyy can't be blank")
      end
      it 'bithday_mmのいずれかが空の場合は登録できない' do
        @user.bithday_mm = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Bithday_mm can't be blank")
      end
      it 'bithday_yyyy、bithday_mm、bithday_ddのいずれかが空の場合は登録できない' do
        @user.bithday_dd = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Bithday_dd can't be blank")
      end
    end
  end
end
