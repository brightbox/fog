module Fog
  module Brightbox
    class Compute
      class Real

        def list_interfaces(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/api/v1/interfaces",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def list_interfaces(options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end