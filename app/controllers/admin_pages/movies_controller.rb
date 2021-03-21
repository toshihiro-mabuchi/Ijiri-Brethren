class AdminPages::MoviesController < ApplicationController
  # layout 'admin_page', except: [:members_view, :general_view]
  before_action :logged_in_user, only: %i(index show)
  before_action :admin_user

  def index
    @member_movies = Movie.member_movie_list_all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    youtube_url = params[:movie][:youtube_url]
    youtube_mid = youtube_url.last(11)
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
        flash[:success] ="#{params[:movie][:category]}動画を追加しました。"
        redirect_to admin_pages_path
      else
        flash[:danger] = "#{params[:movie][:category]}動画の追加に失敗しました。"
        redirect_to admin_pages_path
      end
    else
      flash[:danger] = "URLが正しくありません。"
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id]) 
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    flash[:success] = "動画『#{movie.title}』を更新しました。"
    redirect_to admin_pages_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:success] = "動画『#{@movie.title}』を削除しました。"
    redirect_to admin_pages_path
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :text, :youtube_url, :category)
    end

    def valid_json?(json)
        JSON.parse(json)
        return true
      rescue JSON::ParserError => e
        return false
    end

end
