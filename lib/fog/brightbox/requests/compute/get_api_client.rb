module Fog
  module Brightbox
    class Compute
      class Real

        def get_api_client(identifier, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/api/v1/api_clients/#{identifier}",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def get_api_client(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end