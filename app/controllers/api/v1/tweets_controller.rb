class Api::V1::TweetsController < Api::V1::ApplicationController

  before_action :authenticate_user!

  def index
    render json: paginate(scope: current_user.tweets.order(:created_at))
  end

  def create
    tweet =  current_user.tweets.create(tweet_params)
    if tweet.valid?
      render json: { tweet: tweet }
    else
      render json: { tweet: tweet, errors: tweet.errors }
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
