class Api::V1::UsersController < Api::V1::ApplicationController


  def index
    render json: { users: User.order(:created_at).page(params[:page]) }
  end
end
