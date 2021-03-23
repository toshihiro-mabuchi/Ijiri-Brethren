class AdminPages::GalleriesController < ApplicationController
  # include GalleriesHelper

  before_action :admin_user
  before_action :set_gallery, only: %i(show edit update destroy)
  before_action :set_gallery, only: %i(show edit update destroy)

  def index
    # gallery_list
    if user_signed_in? && current_user.admin?
      @galleries = Gallery.gallery_list_all
    elsif user_signed_in?
      @galleries = Gallery.gallery_list
    end
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    gallery_list
    respond_to do |format|
      if @gallery.save
        format.js { flash.now[:success] = "画像を登録しました。(#{@gallery.title})" }
      else
        format.js { flash.now[:danger] = @gallery.errors.full_messages.join("、") }
      end
    end
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      respond_to do |format|
        gallery_list
        format.js { flash.now[:success] = "画像情報を編集しました。(#{@gallery.title})" }
      end
    else
      render :index
    end
  end

  def destroy
    if @gallery.destroy
      gallery_list
      respond_to do |format|
        format.js { flash.now[:danger] = "画像を削除しました。(#{@gallery.title})" }
      end
    end
  end

  private

    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:category, :title, :display, :image)
    end
end