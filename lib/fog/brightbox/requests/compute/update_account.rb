module Fog
  module Brightbox
    class Compute
      class Real

        def update_account(identifier, options = {})
          request(
            :expects  => [200],
            :method   => 'PUT',
            :path     => "/1.0/accounts/#{identifier}",
            :headers  => {"Content-Type" => "application/json"},
            :body     => options.to_json
          )
        end

      end

      class Mock

        def update_account(identifier, options = {})
          Fog::Mock.not_implemented
        end

      end
    end
  end
end