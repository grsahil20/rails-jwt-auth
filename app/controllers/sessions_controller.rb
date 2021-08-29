class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    unless params.dig(:user, :email).present? && params.dig(:user, :password).present?
      return render json: { error: 'User Email and password are required' }, status: :unprocessable_entity
    else
      super
    end
  end


  private
  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :ok
  end
end
