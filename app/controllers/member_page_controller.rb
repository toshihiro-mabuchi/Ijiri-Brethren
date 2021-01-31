class MemberPageController < ApplicationController

  def index
    if !user_signed_in?
      flash[:danger] = "権限がありません。"
      redirect_to root_path
    end
    @members_infos = Info.where(category: "メンバー")
    @articles = Article.order(updated_at: :desc).limit(2)
    @movies = Movie.where(category: "メンバー")
  end

end
