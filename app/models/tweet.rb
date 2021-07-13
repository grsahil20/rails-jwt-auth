# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :string
#  user_id    :bigint           not null
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tweet < ApplicationRecord
  belongs_to :user

  with_options foreign_key: :parent_id do
    belongs_to :parent_tweet, optional: true
    has_many :retweets
  end

  validates :user, presence: true
  validates :body, presence: true
end
