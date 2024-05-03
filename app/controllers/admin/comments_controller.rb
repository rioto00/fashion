class Admin::CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  
  def index
    @comments = Comment.all
    @comments.each do |comment|
      comment.score = Language.get_data(comment.content)
    end
  end

  def destroy
    set_comment
    @comment.destroy
    redirect_to admin_comments_path, notice: "投稿を削除しました"
  end
  
  private
  
  def set_comment 
    @comment = Comment.find_by(id: params[:id])
    unless @comment
      redirect_to admin_comments_path, alert: "指定されたコメントが見つかりませんでした。"
    end
  end
end