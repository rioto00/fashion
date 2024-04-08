class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
  end

  def show
  end

  def create
    @post = Post.new(post_params) 
    @post.save 
    redirect_to action: 'top'
  end

  def destroy
  end
  
  private
  def post_params 
    params.require(:post).permit(:title, :content) 
  end
  
end
