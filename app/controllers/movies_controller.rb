class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      #SUCCESS
      redirect_to movies_path
    else
      #UNSUCCESSFUL
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
          # SUCCESS
          redirect_to movies_path
        else
          # UNSUCCESSFUL
          render :edit
        end
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

  private

  # def movies_params
  #   params.require(:movie).permit(:name, :director, :description)
  # end


end
