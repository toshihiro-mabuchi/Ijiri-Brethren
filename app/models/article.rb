class Article < ApplicationRecord
  validates :issue_date, presence: true
end
