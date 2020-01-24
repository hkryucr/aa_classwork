class LikesController < ApplicationController
  def index
    like1 = Like.where(user: params[:user_id])

    like_map = like1.map do |like|
      if like.like_type == 'Artwork'
        Artwork.find(like.like_id)
      elsif like.like_type == 'Comment'
        Comment.find(like.like_id)
      end
    end
    render json: like_map
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end

  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    render json: like
  end
end
