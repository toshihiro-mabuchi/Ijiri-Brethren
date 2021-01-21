class HomePageController < ApplicationController
  def index
    @movies = Movie.where(category: "一般")
  end
end
