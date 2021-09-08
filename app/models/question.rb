class Question < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user, optional: true

  validates :hatena, presence:true, length: { maximum: 100 }
end
