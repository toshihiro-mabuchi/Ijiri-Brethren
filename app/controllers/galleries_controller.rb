class GalleriesController < ApplicationController
  before_action :set_gallery, only: %i(show edit update destroy)

  def index
    @galleries = Gallery.all
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:success] = "画像を投稿しました。(#{@gallery.title})"
      redirect_to galleries_url
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:category, :title, :display, :image)
    end
end
