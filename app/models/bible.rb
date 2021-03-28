class Bible < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :subtitle, presence: true, length: { maximum: 50 }
  validates :text, presence: true
end
