module Fog
  module Brightbox
    class Compute < Fog::Service

      AUTHENTICATION_URL = "https://auth.api.brightbox.com/token"
      API_URL = "https://api.brightbox.com/"

      requires :brightbox_client_id, :brightbox_secret

      model_path 'fog/brightbox/models/compute'
      collection :servers
      model :server

      request_path 'fog/brightbox/requests/compute'
      request :list_servers
      request :get_server

      class Mock
        include Collections

        def request(options)
          raise "Not implemented"
        end
      end

      class Real
        include Collections

        def initialize(options)
          get_oauth_token(options)
          api_url = options[:brightbox_api_url] || Fog.credentials[:brightbox_api_url] || API_URL
          @connection = Fog::Connection.new(api_url)
        end

        def request(params)
          begin
            response = authenticated_request(params)
          rescue Excon::Errors::Unauthorized => e
            get_oauth_token
            response = authenticated_request(params)
          end
          response
        end

      private
        def get_oauth_token(options = {})
          @brightbox_client_id ||= options[:brightbox_client_id]
          @brightbox_secret ||= options[:brightbox_secret]
          auth_url = options[:brightbox_auth_url] || Fog.credentials[:brightbox_auth_url] || AUTHENTICATION_URL

          connection = Fog::Connection.new(auth_url)
          @authentication_body = {'client_id' => @brightbox_client_id, 'grant_type' => 'none'}.to_json

          response = connection.request({
            :path => "/token",
            :expects  => 200,
            :headers  => {
              'Authorization' => "Basic " + Base64.encode64("#{@brightbox_client_id}:#{@brightbox_secret}").chomp,
              'Content-Type' => 'application/json'
            },
            :method   => 'POST',
            :body     => @authentication_body
          })
          @oauth_token = JSON.parse(response.body)["access_token"]
          return @oauth_token
        end

        def authenticated_request(options)
          headers = options[:headers] || {}
          headers.merge!("Authorization" => "OAuth #{@oauth_token}")
          options[:headers] = headers
          @connection.request(options)
        end
      end
    end
  end
end