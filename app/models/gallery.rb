class Gallery < ApplicationRecord
  has_one_attached :image
  validates :category, presence: true
  validates :image, content_type: [:png, :jpg, :ipeg]
  validate :image_presence

  def image_presence
    unless image.attached?
      errors.add(:image, 'のファイルを添付してください')
    end
  end
end
