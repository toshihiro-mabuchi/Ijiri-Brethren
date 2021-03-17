class Movie < ApplicationRecord
  enum category: { "メンバー": 0, "一般": 1 }, _suffix: true

  validates :title, presence: true, length: { maximum: 100 }
  validates :text, length: { maximum: 300 }
  validates :youtube_mid, presence: true, length: { maximum: 11 }
  validates :youtube_url, presence: true
  validates :author_name, presence: true


  def self.member_movie_list_all
    where(category: "メンバー").order(display: :DESC, id: :DESC)
  end

  def self.general_movie_list_all
    where(category: "一般").order(display: :DESC, id: :DESC)
  end

  def self.member_movie_list
    where(category: "メンバー").where(display: 1).order(id: :DESC)
  end

  def self.general_movie_list
    where(category: "一般").where(display: 1).order(id: :DESC)
  end
  
end
