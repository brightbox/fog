module Fog
  module Brightbox
    class Compute
      class Real

        def destroy_server(identifier)
          request(
            :expects  => [202],
            :method   => 'DELETE',
            :path     => "/api/v1/servers/#{identifier}"
          )
        end

      end

      class Mock

        def destroy_server(identifier)
          Fog::Mock.not_implemented
        end

      end
    end
  end
end