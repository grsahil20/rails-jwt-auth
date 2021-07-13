class Api::V1::UsersController < Api::V1::ApplicationController


  def index
    render json: paginate(scope: User.order(:created_at))
  end
end
