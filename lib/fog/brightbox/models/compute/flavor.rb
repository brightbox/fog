require 'fog/model'

module Fog
  module Brightbox
    class Compute

      class Flavor < Fog::Model

        identity :id

        attribute :url
        attribute :name
        attribute :status
        # Need to convert units into standardised Fogs values
        attribute :handle
        attribute :bits
        attribute :cores
        attribute :disk, :aliases => "disk_size"
        attribute :name
        attribute :ram

        attribute :resource_type
        attribute :description

      end

    end
  end
end
