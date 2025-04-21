class Item < ApplicationRecord

  validates :name, presence: { message: "can't be blank" }, length: { maximum: 40, message: "is too long (maximum is 40 characters)" }
  validates :description, presence: { message: "can't be blank" }, length: { maximum: 1000, message: "is too long (maximum is 1000 characters)" }
  validates :price,presence: { message: "can't be blank" },format: { with: /\A[0-9]+\z/, message: "is not a number" },numericality: {only_integer: true,greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999,message: "is not a number"}
  validates :image, presence: { message: "must be uploaded" }


  has_one_attached :image
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_schedule
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_schedule_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_payer_id, numericality: { other_than: 1, message: "can't be blank" }

end
