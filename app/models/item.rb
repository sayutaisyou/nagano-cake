class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  
  enum is_active: { "販売中": true, "売切れ": false}

  attachment :image

	validates :image, presence: true
  validates :name, presence: true
	validates :introduction, presence: true
	# validates :genre_id, presence: true# ジャンルエラーが2つ出るからこのコードは一旦コメントアウト。
  validates :price, presence: true,  numericality: { only_integer: true } #「numericality: { only_integer: true }」全角入力禁止。
	validates :is_active, presence: true

end
