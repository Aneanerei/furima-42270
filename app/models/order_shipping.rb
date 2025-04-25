class OrderShipping < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id,
                :city, :street_address, :building_name, :phone_number, :token

  validates :user_id, presence: { message: "can't be blank" }
  validates :item_id, presence: { message: "can't be blank" }
  validates :postal_code, presence: { message: "can't be blank" },
                          format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: { message: "can't be blank" }
  validates :street_address, presence: { message: "can't be blank" }
  validates :phone_number, presence: { message: "can't be blank" },
                           numericality: { only_integer: true, message: 'is invalid. Input only number' },
                           length: { in: 10..11, too_short: 'is too short', too_long: 'is too long' }
  validates :token, presence: { message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end
