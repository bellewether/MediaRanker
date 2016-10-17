class HomeController < ApplicationController

  def index
    @books = Book.all.order(:book_ranking).reverse
    @movies = Movie.all.order(:movie_ranking).reverse
    @albums = Album.all.order(:album_ranking).reverse
  end

end
