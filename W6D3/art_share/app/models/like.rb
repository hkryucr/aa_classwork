# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  like_type  :string
#  like_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :like, :polymorphic => true

end
