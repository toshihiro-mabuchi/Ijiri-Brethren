class MoviesController < ApplicationController
  # layout 'admin_page', except: [:members_view, :general_view]
  before_action :set_member_movies, only: %i(index create update destroy)
  before_action :set_general_movies, only: %i(index create update destroy)
  before_action :logged_in_user, only: %i(index show)
  before_action :admin_user, only: %i(new create edit update destroy)

  def index
    # @member_movies = Movie.where(category: "メンバー")
    # @general_movies = Movie.where(category: "一般")
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
        # flash[:success] ="#{params[:movie][:category]}動画を追加しました。"
        # redirect_to movies_path
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "URLが正しくありません。" }
      end
    #   flash[:danger] = "URLが正しくありません。"
    #   render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id]) 
  end

  def update
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
          text: params[:movie][:text]
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






    # movie = Movie.find(params[:id])
    # if movie.update(movie_params)
    #   respond_to do |format|
    #     format.js { flash.now[:success] = "更新しました" }
    #   end
    # end
    # flash[:success] = "更新しました。"
    # redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      respond_to do |format|
        format.js { flash.now[:danger] = "#{@movie.title}を削除しました。" }
      end
    end
    # flash[:success] = "#{@movie.title}を削除しました。"
    # redirect_to movies_path
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

    def set_member_movies
      @member_movies = Movie.where(category: "メンバー")
    end

    def set_general_movies
      @general_movies = Movie.where(category: "一般")
    end

end
