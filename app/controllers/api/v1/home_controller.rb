class Api::V1::HomeController < Api::V1::ApplicationController

  before_action :authenticate_user!

  def test
    render json: { current_user: current_user }
  end
end
