class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/, message: 'is invalid. Include both letters and numbers' },
            if: :password_required?
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶー一-龥々]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶー一-龥々]+\z/, message: 'is invalid. Input full-width characters' }

  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid.Input full-width katakana characters' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid.Input full-width katakana characters' }
  validates :birth_date, presence: true

  has_many :items
  has_many :purchases
end
