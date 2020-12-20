class Article < ApplicationRecord
  has_one_attached :letter
  validates :issue_date, presence: true
end
