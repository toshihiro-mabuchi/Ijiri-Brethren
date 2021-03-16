class MemberPagesController < ApplicationController
  before_action :logged_in_user

  def index
    @member_infos = Info.where(category: "メンバー", display_flag: true).order(id: :DESC)
    # @articles = Article.order(id: :DESC).limit(2)
    @movies = Movie.member_movie_list_all
    @galleries = Gallery.with_attached_image.where(display: 1).order(:category, :id).group_by(&:category)
  end

  def articles
    @articles = Article.order(created_at: :DESC).limit(2)
  end

end
