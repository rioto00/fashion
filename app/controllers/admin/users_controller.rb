class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @posts = Post.all
    @user_page = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end
end
