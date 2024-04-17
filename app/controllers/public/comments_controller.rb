class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
  
    if @comment.save
      flash[:success] = "コメントが投稿されました"
      redirect_to post_path(@post)
    else
      flash[:error] = "コメントの投稿に失敗しました"
      render 'public/posts/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :other_attribute)
  end
  
end