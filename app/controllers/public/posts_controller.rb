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
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が成功しました。"
      redirect_to root_path
    else
      render :mypage
    end
  end

  def destroy
  end
  
  def get_post_image
  end
  
  private
  def post_params 
    params.require(:post).permit(:title, :content, :genre_id, :post_image, :post_image1, :post_image2, :post_image3, :post_image4) 
  end
  
end
