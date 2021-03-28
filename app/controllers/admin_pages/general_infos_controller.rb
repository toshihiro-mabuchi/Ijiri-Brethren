class AdminPages::GeneralInfosController < ApplicationController
  before_action :admin_user
  before_action :set_info, only: %i(show edit update destroy)

  def index
    # @member_infos = Info.where(category: "メンバー").order(display_flag: :DESC, id: :DESC)
    @general_infos = Info.where(category: "一般").order(display_flag: :DESC, id: :DESC)
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
      redirect_to admin_pages_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @info.update(info_params)
      flash[:success] = "お知らせ「#{@info.title}」を編集しました。"
      redirect_to admin_pages_path
    else
      render :edit
    end
  end

  def destroy
    @info.destroy
    flash[:success] = "お知らせ「#{@info.title}」を削除しました。"
    redirect_to admin_pages_path
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def info_params
      params.require("info").permit(:title, :content, :category, :color, :display_flag)
    end

  end