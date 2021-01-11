class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
    @members_infos = Info.where(category: "メンバー")
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
      flash[:success] = "お知らせの投稿が完了しました。"
      redirect_to infos_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @info.update(info_params)
      flash[:success] = "お知らせの編集が完了しました。"
      redirect_to infos_url
    else
      render :edit
    end
  end

  def destroy
    @info.destroy
    flash[:danger] = "お便りの投稿を削除しました。"
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