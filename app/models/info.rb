class Info < ApplicationRecord
  enum category: { "メンバー": 0, "一般": 1 }, _suffix: true

  validates :title, presence: :true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }

end
