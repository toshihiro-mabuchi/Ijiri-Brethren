class MemberPagesController < ApplicationController
  before_action :logged_in_user

  def index
    @member_infos = Info.where(category: "メンバー", display_flag: true).order(updated_at: :DESC)
    # @articles = Article.order(updated_at: :DESC).limit(2)
    @movies = Movie.where(category: "メンバー")
    @galleries = Gallery.with_attached_image.order(:category, :id).group_by(&:category)
  end

  def articles
    @articles = Article.order(updated_at: :DESC).limit(2)
  end

end
