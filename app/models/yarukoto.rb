class Yarukoto < ApplicationRecord
  belongs_to :user, optional: true
  validates :content, presence: true, length: { maximum: 255 }
end
