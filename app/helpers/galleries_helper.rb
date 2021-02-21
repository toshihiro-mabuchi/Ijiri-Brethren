module GalleriesHelper
  def gallery_list
    @galleries =
      admin_user ? Gallery.with_attached_image.order(:category, "display desc", :id).group_by(&:category)
                          : Gallery.with_attached_image.where(display: 1).order(:category, :id).group_by(&:category)
  end

  def display_background_color(gallery)
    gallery.display == 1 ? "gallery__inner" : "gallery__inner_display_off"
  end
  
end
