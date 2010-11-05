require 'brightbox-fog/core/collection'
require 'brightbox-fog/brightbox/models/compute/server'

module Fog
  module Brightbox
    class Compute

      class Servers < Fog::Collection

        model Fog::Brightbox::Compute::Server

        def all
          # get list of servers
          data = JSON.parse(connection.list_servers.body)
          load(data) # data is an array of attribute hashes
        end

        def get(identifier)
          return nil if identifier.nil? || identifier == ""
          # get server matching id
          data = JSON.parse(connection.get_server(identifier).body)
          new(data) # data is an attribute hash
        rescue Excon::Errors::NotFound
          nil
        end

      end

    end
  end
end