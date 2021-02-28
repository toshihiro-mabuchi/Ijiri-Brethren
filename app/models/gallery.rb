class Gallery < ApplicationRecord
  has_one_attached :image
  validates :category, presence: true, length: { maximum: 30 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :display, presence: true,
                      numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
  validates :image, content_type: [:png, :jpg, :ipeg],
                    size: { less_than_or_equal_to: 10.megabytes }
  validate :image_presence

  def image_presence
    unless image.attached?
      errors.add(:image, 'のファイルを添付してください')
    end
  end
end
