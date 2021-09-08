class Item < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :explanation, presence: true, length: { maximum: 200 }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence: true
  validates :image, presence: true
 
  belongs_to :user, optional: true
  has_many :comments, foreign_key: "item_id", dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
