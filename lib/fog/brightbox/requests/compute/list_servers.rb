module Fog
  module Brightbox
    class Compute
      class Real

        def list_servers
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/api/v1/servers'
          )
        end

      end

      class Mock

        def list_servers
          Fog::Mock.not_implemented
        end

      end
    end
  end
end