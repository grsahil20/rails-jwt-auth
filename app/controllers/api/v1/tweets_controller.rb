class Api::V1::TweetsController < Api::V1::ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  before_action :set_tweet, only: [:destroy]

  def index
    render json: paginate(scope: Tweet.order(:created_at))
  end

  def create
    tweet =  current_user.tweets.create(tweet_params)
    if tweet.valid?
      render json: { tweet: tweet }
    else
      render json: { tweet: tweet, errors: tweet.errors }
    end
  end

  def destroy
    if @tweet.destroy
      render json: { tweet: :destroyed }
    else
      render json: { tweet: tweet, errors: tweet.errors }
    end
  end

  private

  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
