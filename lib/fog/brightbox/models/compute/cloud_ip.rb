require 'fog/model'

module Fog
  module Brightbox
    class Compute

      class CloudIp < Fog::Model

        identity :id

        attribute :url
        attribute :name
        attribute :status
        attribute :resource_type
        attribute :description

        attribute :reverse_dns
        attribute :public_ip

        attribute :account_id, :aliases => "account", :squash => "id"
        attribute :interface_id, :aliases => "interface", :squash => "id"
        attribute :server_id, :aliases => "server", :squash => "id"

      end

    end
  end
end