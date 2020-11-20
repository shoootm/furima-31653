class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @comment = Comment.new(comment_item)
    ActionCable.server.broadcast 'comment_channel', content: @comment, user: current_user if @comment.save
  end

  private

  def comment_item
    params.permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
