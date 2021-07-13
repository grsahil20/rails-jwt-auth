class Api::V1::HomeController < Api::V1::ApplicationController

  # before_action :authenticate_user!

  def test
    ActiveRecord::Base.transaction do
      (100 - User.count).times do |user_time|
        password = Faker::Internet.password
        User.create(email: Faker::Internet.email, password: password, password_confirmation: password)
      end
    end
    User.all.each do |user|
      ActiveRecord::Base.transaction do
        sample = (0..(100 - user.tweets.count)).to_a.sample
        p sample
        sample.times do |tweet|
          user.tweets.create(body: Faker::Quotes::Rajnikanth.joke)
        end
      end
    rescue
      nil
    end
    render json: { users: User.count, tweets: Tweet.count}
  end
end
