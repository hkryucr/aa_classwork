# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

  Comment.destroy_all
  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all


  user1 = User.create!(username: 'CJ')
  user2 = User.create!(username: 'Flarnie')
  user3 = User.create!(username: 'Jeff')
  user4 = User.create!(username: 'Georges St. Pierre')
  user5 = User.create!(username: 'Ned')
  user6 = User.create!(username: 'Jordon Tom')
  user7 = User.create!(username: 'Henry Ryu')
  user8 = User.create!(username: 'Barack Obama')
  user9 = User.create!(username: 'Andrew Yung')

  artwork1 = Artwork.create!(title: 'Mona Lisa', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/687px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', artist_id: user1.id)
  artwork2 = Artwork.create!(title: 'Starry Night', image_url: 'https://google.com', artist_id: user2.id)
  artwork3 = Artwork.create!(title: 'The Scream', image_url: 'https://google.com', artist_id: user3.id)
  artwork4 = Artwork.create!(title: 'The Greate Wave Off Ka', image_url: 'https://google.com', artist_id: user4.id)
  artwork5 = Artwork.create!(title: 'The Creation Of Adam', image_url: 'https://google.com', artist_id: user5.id)
  artwork6 = Artwork.create!(title: 'The Night Watch', image_url: 'https://google.com', artist_id: user6.id)

  
  artwork_share_1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user1.id)
  artwork_share_1 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user7.id)
  artwork_share_2 = ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user4.id)
  artwork_share_3 = ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user2.id)
  artwork_share_4 = ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: user3.id)
  artwork_share_5 = ArtworkShare.create!(artwork_id: artwork6.id, viewer_id: user5.id)
  artwork_share_6 = ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user6.id)
  artwork_share_7 = ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: user4.id)

  comment1 = Comment.create!(artwork_id: artwork1.id, user_id: user1.id, body: 'Look at me!')
  comment1 = Comment.create!(artwork_id: artwork2.id, user_id: user7.id, body: 'Our users will have_many Starry Night')
  comment2 = Comment.create!(artwork_id: artwork3.id, user_id: user4.id, body: 'create The Scream asap')
  comment3 = Comment.create!(artwork_id: artwork4.id, user_id: user2.id, body: 'retrieve comments for an The Greate Wave Off Ka ')
  comment4 = Comment.create!(artwork_id: artwork5.id, user_id: user3.id, body: 'I don''t know what I am talking about')
  comment5 = Comment.create!(artwork_id: artwork6.id, user_id: user5.id, body: 'Who made The Creation Of Adam?')
  comment6 = Comment.create!(artwork_id: artwork4.id, user_id: user6.id, body: 'when and who made The Night Watch?')
  comment7 = Comment.create!(artwork_id: artwork6.id, user_id: user4.id, body: 'I am just checking duplicates inputs')

  Like.destroy_all

  like1 = Like.new(user_id: user1.id, like_type: Artwork, like_id: artwork1.id)
  like1.save
  like2 = Like.new(user_id: user2.id, like_type: Artwork, like_id: artwork2.id)
  like2.save
  like3 = Like.new(user_id: user3.id, like_type: Comment, like_id: comment1.id)
  like3.save
  like4 = Like.new(user_id: user4.id, like_type: Artwork, like_id: artwork2.id)
  like4.save
  like5 = Like.new(user_id: user4.id, like_type: Comment, like_id: comment3.id)
  like5.save
  like6 = Like.new(user_id: user4.id, like_type: Artwork, like_id: artwork3.id)
  like6.save
  like7 = Like.new(user_id: user5.id, like_type: Comment, like_id: comment4.id)
  like7.save
  like8 = Like.new(user_id: user5.id, like_type: Comment, like_id: comment5.id)
  like8.save
  like9 = Like.new(user_id: user6.id, like_type: Artwork, like_id: artwork4.id)
  like9.save
end
# load(Rails.root.join("db", "seeds.rb"))