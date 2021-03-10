module MoviesHelper
  def display_on_or_off(movie)
    movie.display == 1 ? "movie_dicplay_on" : "movie_display_off"
  end
end
