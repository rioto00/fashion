class Public::PostsController < ApplicationController
  
  def new
    @post_new = Post.new
    @user = current_user
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @post_new = Post.new
    @comment = Comment.new
  end

  def create
    @posts = Post.all
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が成功しました。"
      redirect_to root_path
    else
      flash.now[:alert] = "投稿に失敗しました。"
      @posts = Post.all
      @post_new = Post.new
      #@post = Post.find(params[:id])
      render 'public/users/mypage'
    end
  end
  
  
  
  private
  def post_params 
    params.require(:post).permit(:title, :content, :genre_id, :post_image, post_images: []) 
  end
  
end
