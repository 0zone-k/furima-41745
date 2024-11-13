class Item < ApplicationRecord
  validates :title, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :prefecture_id, presence: true
  validates :postage_id, presence: true
  validates :shopping_date_id, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :user, presence: true
end
