require 'fog/collection'
require 'fog/brightbox/models/compute/zone'

module Fog
  module Brightbox
    class Compute

      class Zones < Fog::Collection

        model Fog::Brightbox::Compute::Zone

        def all
          # get list of zones
          data = JSON.parse(connection.list_zones.body)
          load(data) # data is an array of attribute hashes
        end

        def get(identifier)
          return nil if identifier.nil? || identifier == ""
          # get zone matching id
          data = JSON.parse(connection.get_zone(identifier).body)
          new(data) # data is an attribute hash
        rescue Excon::Errors::NotFound
          nil
        end

      end

    end
  end
end