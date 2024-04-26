class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
  
    if @comment.save
      redirect_to post_path(@post)
    else
      @posts = [@post]
      render 'public/posts/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :other_attribute)
  end
end