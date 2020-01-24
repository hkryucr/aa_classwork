class CommentsController < ApplicationController
  def index
    if params.include?(:user_id)
      render json: Comment.where(user: params[:user_id])
    elsif params.include?(:artwork_id)
      render json: Comment.where(artwork: params[:artwork_id])
    else
      render plain: 'Your path is wrong'
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy 
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)

  end
end
