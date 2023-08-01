require 'rails_helper'

# RSpec.describe "Users新規登録", type: :system do
#   before do
#     driven_by(:rack_test)
#   end

#   pending "add some scenarios (or delete) #{__FILE__}"
# end
RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nick_name]', with: @user.nick_name
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      fill_in 'user[kanji_last_name]', with: @user.kanji_last_name
      fill_in 'user[kanji_first_name]', with: @user.kanji_first_name
      fill_in 'user[kana_last_name]', with: @user.kana_last_name
      fill_in 'user[kana_first_name]', with: @user.kana_first_name
      select '1931',from: 'user[birthday_yyyy_mm_dd(1i)]'
      select '10',from: 'user[birthday_yyyy_mm_dd(2i)]'
      select '10',from: 'user[birthday_yyyy_mm_dd(3i)]'      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
        sleep 1

      }.to change { User.count }.by(1)
      # トップページへ遷移することを確認する
      expect(page).to have_current_path(root_path)
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # ユーザー情報を入力する
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      # 新規登録ページへ戻されることを確認する
    end
  end
end
