module Fog
  module Brightbox
    class Compute
      class Real

        def create_account(options = {})
          request(
            :expects  => [201],
            :method   => 'POST',
            :path     => "/1.0/accounts",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def create_account(options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end