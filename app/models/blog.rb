class Blog < ApplicationRecord
  validates :dairy, presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 100 }
end
