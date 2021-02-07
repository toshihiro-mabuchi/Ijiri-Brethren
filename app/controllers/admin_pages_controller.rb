class AdminPagesController < ApplicationController

  def index
    if !current_user.admin?
      flash[:danger] = "権限がありません。"
      redirect_to root_path
    end
    @users = User.all.order(:member_groups, :name)
    # if @users.blank?
      # @users = User.all.order(:member_groups, :name)
      @member_movies = Movie.where(category: "メンバー")
      @general_movies = Movie.where(category: "一般")

      @users_num = @users.size
      @member_movies_num = @member_movies.size
      @general_movies_num = @general_movies.size
    # end
  end

  def home
  end

end
