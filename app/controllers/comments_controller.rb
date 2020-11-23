class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @comment = Comment.new(comment_params)
    ActionCable.server.broadcast 'comment_channel', content: @comment, user: current_user if @comment.save
  end
  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id = @comment.user_id
      @comment.destroy
      redirect_to item_path(@comment.item_id)
    else
      render item_path
    end
  end

  private

  def comment_params
    params.permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
