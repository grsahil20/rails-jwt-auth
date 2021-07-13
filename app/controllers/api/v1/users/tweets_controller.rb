class Api::V1::Users::TweetsController < Api::V1::ApplicationController

  before_action :set_user

  def index
    render json: { users: @user.tweets.order(:created_at).page(params[:page]) }
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
