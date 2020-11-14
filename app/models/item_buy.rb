class ItemBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_number, :building_name, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, numericality: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street_number
    validates :telephone, numericality: { with: /\A\d{10,11}\z/ }
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, telephone: telephone, buy_id: buy.id)
  end
end  