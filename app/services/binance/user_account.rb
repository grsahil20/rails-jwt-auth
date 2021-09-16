module Binance
  class UserAccount

    attr_reader :api_key, :secret_key
    def initialize(api_key:, secret_key:)
      @api_key = api_key
      @secret_key = secret_key
    end

    def info!
      Binance::Api::Account.info!(api_key: api_key, api_secret_key: secret_key)
    end
  end
end
