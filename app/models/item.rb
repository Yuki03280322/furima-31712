class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  belongs_to :user
  has_one_attached :image
  has_one :buy
  has_one :address, through: :buy

  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
