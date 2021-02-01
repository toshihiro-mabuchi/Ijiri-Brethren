class AdminPagesController < ApplicationController

  def index
    if !current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_path
    end
    @users = User.all.order(:member_groups, :name)
    @member_movies = Movie.where(category: "メンバー")
    @general_movies = Movie.where(category: "一般")
  end

  def home
  end

end
