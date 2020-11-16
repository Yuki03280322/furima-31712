class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  validates :email, uniqueness: { case_sensitive: true }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
  validates :password_confirmation, :password, confirmation: true

  with_options presence: true do
    validates :nickname
    validates :password_confirmation
    validates :first_name_kanji
    validates :last_name_kanji
    validates :first_name_kana
    validates :last_name_kana
    validates :date_of_birth
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字(漢字,ひらがな,カタカナ)を使用してください' } do
    validates :first_name_kanji
    validates :last_name_kanji
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
