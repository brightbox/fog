module Fog
  module Brightbox
    class Compute
      class Real

        def close_account(identifier, options = {})
          request(
            :expects  => [200],
            :method   => 'POST',
            :path     => "/api/v1/accounts/#{identifier}",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def close_account(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end