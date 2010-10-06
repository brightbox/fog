module Fog
  module Brightbox
    class Compute
      class Real

        def map_cloud_ip(identifier, options = {})
          request(
            :expects  => [202],
            :method   => 'POST',
            :path     => "/api/v1/cloud_ips/#{identifier}/map",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def map_cloud_ip(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end