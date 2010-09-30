require 'fog/model'

module Fog
  module Brightbox
    class Compute

      class Zone < Fog::Model

        identity :id

        attribute :url
        attribute :name
        attribute :status
        attribute :resource_type
        attribute :description

      end

    end
  end
end