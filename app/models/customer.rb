class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :encrypted_password, presence: true,
                                 length: { minimum:8 }

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  #  order/newで使う値を定義
   def full_name
    self.last_name + ' '+ self.first_name
   end
end



