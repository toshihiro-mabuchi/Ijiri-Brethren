class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    url = params[:movie][:youtube_url]
    url = url.last(11)
    @movie.youtube_url = url
    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end

    # -------------------------------
    # Movie.create(movie_params)
    # redirect_to movies_path
    # -------------------------------
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
