class Admin::GenresController < ApplicationController
  
  def index
    @genre_new = Genre.new
    @genres = Genre.all
    #@genres = Genre.page(params[:page]).per(8)
  end

  def new
    @genre_new = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre_new = Genre.new(genre_params)
    if @genre_new.save
      redirect_to admin_genres_path, notice: 'ジャンルを追加しました'
    else
      render :new
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: 'ジャンルを更新しました'
    else
      render :edit
    end
  end
  
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
