class Admin::GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  
  def index
    @genre_new = Genre.new
    @genres = Genre.all
    @genre_page = Genre.all.page(params[:page])
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

  def destroy
    @genre.destroy
    redirect_to admin_genres_path, notice: 'ジャンルを削除しました'
  end
  
  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end