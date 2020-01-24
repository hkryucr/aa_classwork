# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  # validates :name, :email, presence: true, uniqueness: true
  validates :title, uniqueness: {scope: :artist_id}

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User,
    optional: true

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments, dependent: :destroy,
    primary_key: :id, 
    foreign_key: :artwork_id,
    class_name: :Comment

  has_many :likes, as: :like

end
