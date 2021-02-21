class AdminPagesController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all.order(:member_groups, :name)
    @member_movies = Movie.where(category: "メンバー")
    @general_movies = Movie.where(category: "一般")
    @articles = Article.order(updated_at: :desc)
    @member_infos = Info.where(category: "メンバー")
    @general_infos = Info.where(category: "一般")
    @galleries = Gallery.all.order(:category, :id).group_by(&:category)

    # @users_num = @users.size
    @users_group1_num = User.where(member_groups: "グループ１").where.not(name: "管理者").size
    @users_group2_num = User.where(member_groups: "グループ２").size 
    @member_movies_num = @member_movies.size
    @general_movies_num = @general_movies.size
    # @articles_num = @articles.size
    @member_infos_num = @member_infos.size
    @general_infos_num = @general_infos.size
    @galleries_num = Gallery.all.size
  end

  def home
  end

end
