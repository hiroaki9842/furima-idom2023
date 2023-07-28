class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  validates :nick_name, presence: true
  validates :email, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :encrypted_password, presence: true,length:{minimum:6},format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}
  # validates :password, presence: true,length:{minimum:6}

  validates :kanji_first_name, presence: true
  validates :kanji_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :birthday_yyyy, presence: true
  validates :birthday_mm, presence: true
  validates :birthday_dd, presence: true


end
