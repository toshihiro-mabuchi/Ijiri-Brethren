class HomePageController < ApplicationController
  def index
    @general_infos = Info.where(category: "一般", display_flag: true).order(id: :DESC)
    @movies = Movie.general_movie_list
    @bible = Bible.find_by(display_flag: true)
  end
end
