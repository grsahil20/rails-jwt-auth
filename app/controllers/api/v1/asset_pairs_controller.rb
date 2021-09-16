class Api::V1::AssetPairsController < Api::V1::ApplicationController

  # before_action :authenticate_user!, only: [:create, :destroy]

  # iddUErziVQDqsoGHKb7qlOF96UeLeavYFmCtmCiz6GN9RpBN1iismchv1CnejNk5
  # yp5hfH1eUvVkAdbCFC9S5qmii631c4cSXMLgUJQ8OtKEd6ivJN6XmtEOYcz9gjaW

  def index
    account =Binance::UserAccount.new(api_key: ENV['BINANCE_DEFAULT_API_KEY'], secret_key: ENV['BINANCE_DEFAULT_SECRET_KEY'])
    render json: account.info!

  end

  private
end
