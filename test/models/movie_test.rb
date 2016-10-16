require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Create a movie with valid data" do
    movie = Movie.new(name: "foo", director: "bar")
    assert movie.valid?
  end

  test "Create two movies with different names" do
    movie_one = Movie.create!(name: "Rebel Without a Cause", director: "Nicholas Ray")
    movie_two = Movie.create!(name: "Do the Right Thing", director: "Spike Lee")
    assert movie_two.valid?
  end

  test "Cannot create two movies with the same name" do
    movie_one = Movie.create!(name: "25th Hour", director: "Spike Lee")
    movie_two = Movie.new(name: "25th Hour", director: "Spike Lee")
    assert_not movie_two.valid?
  end

  test "Cannot create a movie with no name" do
    movie = Movie.new(director: "bar")
    assert_not movie.valid?
  end

  test "Cannot create a movie with no director" do
    movie = Movie.new(name: "foo")
    assert_not movie.valid?
  end
end
