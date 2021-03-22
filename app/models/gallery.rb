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

  def self.gallery_list_all
    with_attached_image.order(:category, "display desc", :id).group_by(&:category)
  end

  def self.gallery_list
    with_attached_image.where(display: 1).order(:category, :id).group_by(&:category)
  end

  # def gallery_list
  #   @galleries =
  #   if user_signed_in? && current_user.admin?
  #     Gallery.with_attached_image.order(:category, "display desc", :id).group_by(&:category)
  #   elsif user_signed_in?
  #     Gallery.with_attached_image.where(display: 1).order(:category, :id).group_by(&:category)
  #   end
  # end
end
