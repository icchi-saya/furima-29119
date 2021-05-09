class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :purchase_records
  has_many :comments

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message:'Full-width characters'} do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message:'kana Full-width katakana characters'} do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :nickname, presence: true
  validates :birthday, presence: true
  VALID_PASSWORD_REGEX =  /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
end
