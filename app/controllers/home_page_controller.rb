class HomePageController < ApplicationController

  def index
    @general_infos = Info.where(category: "一般", display_flag: true).order(created_at: :DESC).limit(6)
    @movies = Movie.general_movie_list
    @bible = Bible.find_by(display_flag: true)
    @now = Time.current
  end

  def infos
    @general_infos = Info.where(category: "一般", display_flag: true).order(created_at: :DESC)
                         .paginate(page: params[:page], per_page: 12)
    @now = Time.current
  end
end
