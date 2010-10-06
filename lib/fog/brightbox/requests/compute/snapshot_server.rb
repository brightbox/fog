module Fog
  module Brightbox
    class Compute
      class Real

        def snapshot_server(identifier, options = {})
          request(
            :expects  => [202],
            :method   => 'POST',
            :path     => "/1.0/servers/#{identifier}/snapshot",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def snapshot_server(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end