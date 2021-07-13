class Api::V1::TweetsController < Api::V1::ApplicationController

  before_action :authenticate_user!

  def index
    render json: { tweets: current_user.tweets.order(:created_at).page(params[:page]) }
  end

  def create
    tweet =  current_user.tweets.create(tweet_params)
    if tweet.valid?
      render json: { tweet: current_user.tweets.create(tweet_params) }
    else
      render json: { tweet: current_user.tweets.create(tweet_params), errors: tweet.errors }
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
