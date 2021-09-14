class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :nickname, presence: true
  
  has_many :items, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  

  has_many :events, foreign_key: :user_id, dependent: :destroy
  has_many :questions,  foreign_key: :user_id, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :event

  has_many :iines, dependent: :destroy
  has_many :iine_items, through: :iines, source: :item

  def already_like?(event)
    self.likes.exists?(event_id: event.id)
  end

  def already_liked?(item)
    self.iines.exists?(item_id: item.id)
  end
end


