class Item < ApplicationRecord
  validates :title, presence: true
  validates :introduction, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_date_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, presence: true

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :postage
  belongs_to :shopping_date
  belongs_to :category
  belongs_to :situation
end
