require 'fog/model'

module Fog
  module Brightbox
    class Compute

      class Image < Fog::Model

        identity :id

        attribute :url
        attribute :name
        attribute :status
        attribute :source
        attribute :source_type

        attribute :ancestor_id, :aliases => "ancestor", :squash => "id"
        attribute :owner_id, :aliases => "owner", :squash => "id"
        attribute :arch

        attribute :resource_type
        attribute :description
        attribute :public
        attribute :official
        attribute :virtual_size
        attribute :disk_size
        attribute :created_at

      end

    end
  end
end