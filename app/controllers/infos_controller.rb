class InfosController < ApplicationController
  before_action :logged_in_user, only: %i(index show)
  before_action :admin_user, only: %i(new create edit update destroy)
  before_action :set_info, only: %i(show edit update destroy)

  def index
    @member_infos = Info.where(category: "メンバー")
    @general_infos = Info.where(category: "一般")
  end

  def show
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)
    if @info.save
      flash[:success] = "お知らせ「#{@info.title}」を投稿しました。"
      redirect_to infos_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @info.update(info_params)
      flash[:success] = "お知らせ「#{@info.title}」を編集しました。"
      redirect_to infos_url
    else
      render :edit
    end
  end

  def destroy
    @info.destroy
    flash[:danger] = "お知らせ「#{@info.title}」を削除しました。"
    redirect_to infos_url
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def info_params
      params.require("info").permit(:title, :content, :category, :color)
    end
end