module GalleriesHelper
  def gallery_list
    @galleries =
    if user_signed_in? && current_user.admin?
      Gallery.with_attached_image.order(:category, "display desc", :id).group_by(&:category)
    elsif user_signed_in?
      Gallery.with_attached_image.where(display: 1).order(:category, :id).group_by(&:category)
    else
      redirect_to root_url
    end
  end

  def display_background_color(gallery)
    gallery.display == 1 ? "gallery__inner" : "gallery__inner_display_off"
  end

  def modal_form_class
    if controller.action_name == "new"
      "new"
    elsif controller.action_name == "edit"
      "edit"
    end
  end
end
