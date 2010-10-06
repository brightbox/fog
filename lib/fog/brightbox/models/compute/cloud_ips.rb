require 'fog/collection'
require 'fog/brightbox/models/compute/cloud_ip'

module Fog
  module Brightbox
    class Compute

      class CloudIps < Fog::Collection

        model Fog::Brightbox::Compute::CloudIp

        def all
          data = JSON.parse(connection.list_cloud_ips.body)
          load(data) # data is an array of attribute hashes
        end

        def get(identifier)
          return nil if identifier.nil? || identifier == ""
          data = JSON.parse(connection.get_cloud_ip(identifier).body)
          new(data) # data is an attribute hash
        rescue Excon::Errors::NotFound
          nil
        end

        def allocate
          data = JSON.parse(connection.create_cloud_ip.body)
          new(data)
        end

      end

    end
  end
end