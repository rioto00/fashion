class Admin::GenresController < ApplicationController
  
  def index
    @genre_new = Genre.new
    @genres = Genre.all
    @genres = Genre.page(params[:page]).per(8)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end
end
