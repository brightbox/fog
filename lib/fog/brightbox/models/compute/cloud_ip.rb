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
        attribute :interface_id, :aliases => "destination", :squash => "id"
        attribute :server_id, :aliases => "server", :squash => "id"

        def map(interface_to_map)
          requires :identity
          connection.map_cloud_ip(identity, :interface => interface_to_map)
        end

        def unmap
          requires :identity
          connection.unmap_cloud_ip(identity)
        end

      end

    end
  end
end