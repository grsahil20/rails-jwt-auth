# == Schema Information
#
# Table name: follower_ships
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  follower_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class FollowerShip < ApplicationRecord

    belongs_to :user
    belongs_to :follower, class_name: "User"

  end
