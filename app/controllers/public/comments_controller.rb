class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
  
    if @comment.save
      flash[:success] = "コメントが投稿されました"
      redirect_to post_path(@post)
    else
      flash[:error] = "コメントの投稿に失敗しました"
      @posts = [@post]
      render 'public/posts/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :other_attribute)
  end
end