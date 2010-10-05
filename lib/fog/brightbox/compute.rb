module Fog
  module Brightbox
    class Compute < Fog::Service

      AUTHENTICATION_URL = "https://auth.api.brightbox.com/token"
      API_URL = "https://api.brightbox.com/"

      requires :brightbox_client_id, :brightbox_secret

      model_path 'fog/brightbox/models/compute'
      collection :servers
      model :server
      collection :flavors
      model :flavor
      collection :images
      model :image
      collection :zones
      model :zone
      collection :cloud_ips
      model :cloud_ip

      request_path 'fog/brightbox/requests/compute'
      request :create_account
      request :create_api_client
      request :create_cloud_ip
      request :create_image
      request :create_server
      request :destroy_api_client
      request :destroy_cloud_ip
      request :destroy_image
      request :destroy_server
      request :get_account
      request :get_api_client
      request :get_cloud_ip
      request :get_image
      request :get_interface
      request :get_server
      request :get_server_type
      request :get_user
      request :get_zone
      request :list_accounts
      request :list_api_clients
      request :list_cloud_ips
      request :list_images
      request :list_server_types
      request :list_servers
      request :list_users
      request :list_zones
      request :map_cloud_ip
      request :rebuild_server
      request :reset_ftp_password_account
      request :resize_server
      request :restart_server
      request :shutdown_server
      request :snapshot_server
      request :start_server
      request :stop_server
      request :unmap_cloud_ip
      request :update_account
      request :update_api_client
      request :update_image
      request :update_server
      request :update_user

      class Mock

        def request(options)
          raise "Not implemented"
        end
      end

      class Real

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