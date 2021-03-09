class AdminPagesController < ApplicationController
  before_action :admin_user

  def index
    
  end

  def home
    @users = User.where.not(name: "管理者").order(:member_groups, :name)
    @member_movies = Movie.where(category: "メンバー")
    @general_movies = Movie.where(category: "一般")
    @articles = Article.order(updated_at: :DESC)
    @article_years = Article.with_attached_letter.order(issue_date: :DESC).group_by { |year| year.issue_date.strftime("%Y") }
    @member_infos = Info.where(category: "メンバー").order(display_flag: :DESC, updated_at: :DESC)
    @general_infos = Info.where(category: "一般").order(display_flag: :DESC, updated_at: :DESC)
    @galleries = Gallery.all.order(:category, "display desc", :id).group_by(&:category)
    @bibles = Bible.all.order(:id)
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

end
