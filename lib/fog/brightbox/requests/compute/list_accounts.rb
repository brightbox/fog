module Fog
  module Brightbox
    class Compute
      class Real

        def list_accounts(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/1.0/accounts",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def list_accounts(options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end