class Article < ApplicationRecord
  has_one_attached :letter
  validates :issue_date, presence: true
  validates :letter, content_type: [:pdf], size: { less_than_or_equal_to: 5.megabytes }
  validate :letter_presence

  def letter_presence
    unless letter.attached?
      errors.add(:letter, 'のファイルを添付してください')
    end
  end
end
