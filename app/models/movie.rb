class Movie < ApplicationRecord
  enum category: { member: 0, no_member: 1 }, _suffix: true

  validates :title, presence: true, length: { maximum: 100 }
  # validates :thumbnail_url,
  validates :youtube_mid, presence: true, length: { maximum: 11 }
  # validates :youtube_url,
  validates :author_name, presence: true

  
end
