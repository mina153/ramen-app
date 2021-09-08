class Event < ApplicationRecord
  validates :theme, presence: true, length: { maximum: 20 }
  validates :detail, presence: true, length: { maximum: 100 }
  validates :date, presence: true
  validates :start_at, presence: true
  validates :finish_at, presence: true



  belongs_to :user, optional: true
  has_many :questions, foreign_key: "event_id", dependent: :destroy
end
