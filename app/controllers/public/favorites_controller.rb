class Public::FavoritesController < ApplicationController
  
  def show
    @user = current_user
    @likes = @user.liked_posts
  end
  
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
    #redirect_to request.referer
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
    #redirect_to request.referer
  end

end
