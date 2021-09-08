class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true
  

  validates :text, presence: true, length: { maximum: 100 }
end
