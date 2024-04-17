class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @posts = Post.all
  end

  def about
  end
  
  def search
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts 
    else
      @posts = Post.all 
    end
  end

end