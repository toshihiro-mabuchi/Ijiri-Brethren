class GalleriesController < ApplicationController
  include GalleriesHelper

  before_action :set_gallery, only: %i(show edit update destroy)
  before_action :admin_user, only: %i(new create edit update destroy)

  def index
    gallery_list
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:success] = "画像を登録しました。(#{@gallery.title})"
      redirect_to galleries_url
    else
      flash[:alert] = @gallery.errors.full_messages
      redirect_to galleries_url
    end
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      flash[:success] = "画像を更新しました。(#{@gallery.title})"
      redirect_to galleries_url
    else
      redirect_to galleries_url
    end
  end

  def destroy
    @gallery.destroy
    flash[:danger] = "画像を削除しました。(#{@gallery.title})"
    redirect_to galleries_url
  end

  private

    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:category, :title, :display, :image)
    end
end
