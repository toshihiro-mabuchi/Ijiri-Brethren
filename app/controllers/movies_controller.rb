class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    Movie.create(movie_params)
    redirect_to movies_path
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
  end

  def edit
    @movie = Movie.find(params[:id]) 
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :youtube_url)
    end

end
