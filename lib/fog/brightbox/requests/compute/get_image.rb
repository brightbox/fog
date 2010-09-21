module Fog
  module Brightbox
    class Compute
      class Real

        def get_image(identifier, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/api/v1/images/#{identifier}",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def get_image(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end