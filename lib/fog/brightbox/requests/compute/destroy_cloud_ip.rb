module Fog
  module Brightbox
    class Compute
      class Real

        def destroy_cloud_ip(identifier, options = {})
          request(
            :expects  => [200],
            :method   => 'DELETE',
            :path     => "/api/v1/cloud_ips/#{identifier}",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def destroy_cloud_ip(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end