module Fog
  module Brightbox
    class Compute
      class Real

        def start_server(identifier, options = {})
          request(
            :expects  => [202],
            :method   => 'POST',
            :path     => "/api/v1/servers/#{identifier}/start",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def start_server(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end