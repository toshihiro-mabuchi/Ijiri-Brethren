class HomePageController < ApplicationController
  def index
    @general_infos = Info.where(category: "一般")
    @movies = Movie.where(category: "一般")
    @bible = Bible.find_by(display_flag: true)
  end
end
