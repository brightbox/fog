module Fog
  module Brightbox
    class Compute
      class Real

        def create_server(options = {})
          request(
            :expects  => [201],
            :method   => 'POST',
            :path     => "/api/v1/servers",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def create_server(options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end