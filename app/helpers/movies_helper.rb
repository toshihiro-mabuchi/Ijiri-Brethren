module MoviesHelper
  # def member_movie_list
  #   @member_movies =
  #   if user_signed_in? && current_user.admin?
  #     Movie.where(category: "メンバー").order(display: :DESC)
  #   elsif user_signed_in?
  #     Movie.where(category: "メンバー").where(display: 1).order(display: :DESC)
  #   end
  # end

  # def general_movie_list
  #   @general_movies =
  #   if user_signed_in? && current_user.admin?
  #     Movie.where(category: "一般").order(display: :DESC)
  #   else
  #     Movie.where(category: "一般").where(display: 1).order(display: :DESC)
  #   end
  # end

  def display_on_or_off(movie)
    movie.display == 1 ? "movie_dicplay_on" : "movie_display_off"
  end
end
