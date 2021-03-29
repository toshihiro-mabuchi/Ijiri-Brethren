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
      respond_to do |format|
        format.js { flash.now[:success] = "お知らせ「#{@info.title}」の投稿が完了しました。" }
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "お知らせの投稿に失敗しました。" }
      end
    end
    @general_infos = Info.where(category: "一般").order(display_flag: :DESC, id: :DESC)
  end

  def edit
  end

  def update
    if @info.update(info_params)
      respond_to do |format|
        format.js { flash.now[:success] = "お知らせ「#{@info.title}」の編集が完了しました。" }
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "お知らせ「#{@info.title}」の編集に失敗しました。" }
      end
    end
    @general_infos = Info.where(category: "一般").order(display_flag: :DESC, id: :DESC)
  end

  def destroy
    @info.destroy
    @general_infos = Info.where(category: "一般").order(display_flag: :DESC, id: :DESC)
    respond_to do |format|
      format.js { flash.now[:danger] = "お知らせ「#{@info.title}」を削除しました。" }
    end
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def info_params
      params.require("info").permit(:title, :content, :category, :color, :display_flag)
    end

  end