class AdminPages::MoviesController < ApplicationController
  include MoviesHelper
  # layout 'admin_page', except: [:members_view, :general_view]
  before_action :logged_in_user, only: %i(index show)
  before_action :admin_user

  def index
    if current_user.admin?
      @member_movies = Movie.member_movie_list_all
      @general_movies = Movie.general_movie_list_all
    else
      @member_movies = Movie.member_movie_list
      @general_movies = Movie.general_movie_list
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @member_movies = Movie.member_movie_list_all
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
        text: params[:movie][:text]
      })
      if movie.save
        respond_to do |format|
          format.js { flash.now[:success] = "#{params[:movie][:category]}動画を追加しました。" }
        end
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "URLが正しくありません。" }
      end
    end
  end

  def edit
    @movie = Movie.find(params[:id]) 
  end

  def update
    @member_movies = Movie.member_movie_list_all
    @movie = Movie.find(params[:id])
    youtube_url = params[:movie][:youtube_url]
    youtube_mid = youtube_url.last(11)
    url = "https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=#{youtube_mid}&format=json"
    url = URI.encode url
    uri = URI.parse url
    require "net/http"
    json = Net::HTTP.get(uri)
    if valid_json?(json)
      if movie_json = JSON.parse(json)
        @movie.update_attributes ({
          title: movie_json["title"],
          thumbnail_url: movie_json["thumbnail_url"],
          youtube_mid: youtube_mid,
          youtube_url: "https://youtu.be/#{youtube_mid}",
          author_name: movie_json["author_name"],
          category: params[:movie][:category],
          text: params[:movie][:text],
          display: params[:movie][:display]
        })
      end
      respond_to do |format|
        format.js { flash.now[:success] = "動画を更新しました。" }
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "URLが正しくありません。" }
      end
    end
  end

  def destroy
    @member_movies = Movie.member_movie_list_all
    @movie = Movie.find(params[:id])
    if @movie.destroy
      respond_to do |format|
        format.js { flash.now[:success] = "#{@movie.title}を削除しました。" }
      end
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :text, :youtube_url, :category, :display)
    end

    def valid_json?(json)
        JSON.parse(json)
        return true
      rescue JSON::ParserError => e
        return false
    end

end
