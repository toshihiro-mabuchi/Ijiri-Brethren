class Movie < ApplicationRecord
  enum category: { "メンバー": 0, "一般": 1 }, _suffix: true

  validates :title, presence: true, length: { maximum: 100 }
  validates :text, length: { maximum: 300 }
  validates :youtube_mid, presence: true, length: { maximum: 11 }
  validates :youtube_url, presence: true
  validates :author_name, presence: true
  
end
