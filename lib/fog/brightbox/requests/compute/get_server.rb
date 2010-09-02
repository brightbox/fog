module Fog
  module Brightbox
    class Compute
      class Real

        def get_server(identifier)
          # return nil if identifier.nil? || identifier == ""
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/api/v1/servers/#{identifier}"
          )
        end

      end

      class Mock

        def get_server(identifier)
          Fog::Mock.not_implemented
        end

      end
    end
  end
end