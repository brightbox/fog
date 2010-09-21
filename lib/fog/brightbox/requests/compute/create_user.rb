module Fog
  module Brightbox
    class Compute
      class Real

        def create_user(options = {})
          request(
            :expects  => [201],
            :method   => 'POST',
            :path     => "/api/v1/users",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def create_user(options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end