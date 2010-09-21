module Fog
  module Brightbox
    class Compute
      class Real

        def rebuild_server(identifier, options = {})
          request(
            :expects  => [202],
            :method   => 'POST',
            :path     => "/api/v1/servers/#{identifier}",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def rebuild_server(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end