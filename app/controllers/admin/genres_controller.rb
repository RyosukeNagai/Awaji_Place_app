class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    Genre.create(genre_params)
    @genres = Genre.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
