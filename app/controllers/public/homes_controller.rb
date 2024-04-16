class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @posts = Post.all
  end

  def about
  end
  
#   def search
#     @genres = Genre.all
#     @genre_id = params[:genre_id]
#     @posts_search = Post.where(genre_id: @genre_id).page(params[:page]).per(10)
#   end
end

