class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def genre_search
    @genre_id = params[:genre_id]
    @genre = Genre.find(@genre_id)
    @genres = Genre.all
    @posts =  @genre.posts.page(params[:page])
    
    if @genre_id.present?
      @genre = Genre.find_by(id: @genre_id)
      @users = User.joins(:posts).where(posts: { genre_id: @genre_id }).distinct
    else
      @users = User.all
    end
  end
  
#検索窓
  def search
    @genres = Genre.all
    @range = params[:range]
    if @range == "Post"
      if params[:search]
        @posts = Post.where("title LIKE ?", "%#{params[:search]}%")
        @posts_title = "「#{params[:search]}」の検索結果"
      else
        @posts = Post.all
      end
      @post = Post.new
    elsif @range == "User"
      if params[:search]
        @users = User.where("name LIKE ?", "%#{params[:search]}%")
        @users_name = "「#{params[:search]}」の検索結果"
      else
        @users = User.all
      end
      @user = User.new
    end
  end
end