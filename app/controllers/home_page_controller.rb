class HomePageController < ApplicationController
  def index
    @general_infos = Info.where(category: "一般", display_flag: true).order(updated_at: :DESC)
    @movies = Movie.where(category: "一般")
    @bible = Bible.find_by(display_flag: true)
  end
end
