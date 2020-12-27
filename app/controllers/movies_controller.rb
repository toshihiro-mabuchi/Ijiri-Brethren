class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def members_view
    @movies = Movie.where(category: "メンバー")
  end

  def general_view
    @movies = Movie.where(category: "一般")
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    youtube_url = params[:movie][:youtube_url]
    youtube_mid = youtube_url.last(11)
    # if youtube_mid.present?
    # else
    # end
    url = "https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=#{youtube_mid}&format=json"
    url = URI.encode url
    uri = URI.parse url
    require "net/http"
    json = Net::HTTP.get(uri)
    if valid_json?(json)
      movie_json = JSON.parse(json)
      movie = Movie.new({
        title: movie_json["title"],
        thumbnail_url: movie_json["thumbnail_url"],
        youtube_mid: youtube_mid,
        youtube_url: "https://youtu.be/#{youtube_mid}",
        author_name: movie_json["author_name"],
        category: params[:movie][:category],
      })
      if movie.save
        redirect_to movies_path
      else

      end
    else
      # URLが正しくありません。
      render :new
    end

    # ------------------------
    # @movie.youtube_url = youtube_url
    # respond_to do |format|
    #   if @movie.save
    #     format.html { redirect_to movies_path, notice: 'Post was successfully created.' }
    #     format.json { render :show, status: :created, location: @movie }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @movie.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
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
      params.require(:movie).permit(:title, :youtube_url, :category)
    end

    def valid_json?(json)
        JSON.parse(json)
        return true
      rescue JSON::ParserError => e
        return false
    end

end
