class ArtworksController < ApplicationController
  def index
    p params
    artist_artworks = Artwork.where(artist: params[:user_id])
    viewer_artworks_share = ArtworkShare.where(viewer: params[:user_id])
    viewer_artworks = viewer_artworks_share.map do |artwork_share|
      Artwork.find(artwork_share.artwork_id)
    end
      render json: (artist_artworks + viewer_artworks).uniq
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end

  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end