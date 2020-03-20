class CommentsController < ApplicationController
  before_action :set_comment, only: [:create]

  def create
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      alert('コメントに失敗しました')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.json
      end
    else
      alert('削除に失敗しました')
    end
  end

  private 
  def set_comment
    @comment = Comment.new(comment_params)
  end

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
