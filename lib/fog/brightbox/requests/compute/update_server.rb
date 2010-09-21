module Fog
  module Brightbox
    class Compute
      class Real

        def update_server(identifier, options = {})
          request(
            :expects  => [200],
            :method   => 'PUT',
            :path     => "/api/v1/servers/#{identifier}",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def update_server(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end