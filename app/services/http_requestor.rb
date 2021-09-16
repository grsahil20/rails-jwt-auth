require "uri"
#
#
# Example :
# options = {headers: HEADER_HASH, params: PARAMS}
# HttpRequester.post(url, options) do |response_body, response, request|
#   Do something with response_body, response, request
# end
#



class HttpRequestor
  DEFAULT_PROXY = Rails.application.credentials[Rails.env.to_sym][:proxy] rescue {}

  DEFAULT_HEADERS = {'Accept': 'application/json','Content-Type': 'application/json'}

  def self.get(url, options = {}, &block)
    begin
      uri = URI(url)
      uri.query = URI.encode_www_form(options[:params]) if options[:params].present?
      _request = Net::HTTP::Get.new(uri, HttpRequestor::DEFAULT_HEADERS)
      options[:headers].each {|key, value| _request[key] = value} if options[:headers].present?
      Net::HTTP.start(uri.host, uri.port, {use_ssl: true}) do |http|
        set_proxy(http) if(options[:proxy])
        http.ssl_version = :TLS1_2_VERSION
        _response = http.request(_request)
        yield(_response.body, _response, _request)
      end
    rescue Exception => e
      Rails.logger.debug 'Unable to fetch details from APIs'
      Rails.logger.debug e.message
      Rails.logger.debug e.backtrace.join("\n")
      nil
    end
  end


  def self.post(url, options = {}, &block)
    begin
      uri = URI(url)
      _request = Net::HTTP::Post.new(uri, HttpRequestor::DEFAULT_HEADERS)
      options[:headers].each {|key, value| _request[key] = value} if options[:headers].present?
      if options[:params].present?
        _request.body  = options[:params].is_a?(Hash) ? options[:params].to_json : options[:params]
      end
      Net::HTTP.start(uri.host, uri.port, {use_ssl: true}) do |http|
        http.ssl_version = :TLS1_2_VERSION
        set_proxy(http) if(options[:proxy])
        _response = http.request(_request)
        yield(_response.body, _response, _request)
      end
    rescue Exception => e
      Rails.logger.debug 'Unable to post details to APIs'
      Rails.logger.debug e.message
      Rails.logger.debug e.backtrace.join("\n")
      nil
    end
  end

  def self.put(url, options = {}, &block)
    begin
      uri = URI(url)
      _request = Net::HTTP::Put.new(uri, HttpRequestor::DEFAULT_HEADERS)
      options[:headers].each {|key, value| _request[key] = value} if options[:headers].present?
      if options[:params].present?
        _request.body  = options[:params].is_a?(Hash) ? options[:params].to_json : options[:params]
      end
      Net::HTTP.start(uri.host, uri.port, {use_ssl: true}) do |http|
        http.ssl_version = :TLS1_2_VERSION
        set_proxy(http) if(options[:proxy])
        _response = http.request(_request)
        yield(_response.body, _response, _request)
      end
    rescue Exception => e
      Rails.logger.debug 'Unable to post details to APIs'
      Rails.logger.debug e.message
      Rails.logger.debug e.backtrace.join("\n")
      nil
    end
  end

  # Example : {proxy_address: 'PROXY_ADDRESS', proxy_port: 'PORT', proxy_user: 'PROXY_USER', proxy_pass: 'PROXY_PASSWORD' }
  def self.set_proxy(object, options = HttpRequestor::DEFAULT_PROXY)
    options.each {|p_key, p_value| object.send(p_key, p_value)}
  end

end
