
class Tweet < ApplicationRecord
  belongs_to :user

  with_options foreign_key: :parent_id do
    belongs_to :parent_tweet, optional: true
    has_many :retweets
  end

  validates :user, presence: true
  validates :body, presence: true
end
