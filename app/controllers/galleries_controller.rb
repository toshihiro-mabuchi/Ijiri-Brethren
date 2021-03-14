class GalleriesController < ApplicationController
  include GalleriesHelper

  before_action :logged_in_user, only: %i(index show)
  before_action :admin_user, only: %i(new create edit update destroy)
  before_action :set_gallery, only: %i(show edit update destroy)

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
    respond_to do |format|
      if @gallery.save
        gallery_list
        format.js { flash.now[:success] = "画像を登録しました。(#{@gallery.title})" }
      else
        render :index
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
