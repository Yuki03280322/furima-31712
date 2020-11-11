class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :email, uniqueness: { case_sensitive: true }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i }
  validates :password_confirmation, presence: true
  validates :password_confirmation, :password, confirmation: true
  validates :date_of_birth, presence: true  

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字(漢字,ひらがな,カタカナ)を使用してください' } do
    validates :first_name_kanji
    validates :last_name_kanji
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

end

