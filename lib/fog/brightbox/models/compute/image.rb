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

        attribute :ancestor_image
        attribute :arch

        attribute :resource_type
        attribute :description
        attribute :public, :type => :boolean
        attribute :official, :type => :boolean
        attribute :virtual_size
        attribute :disk_size

      end

    end
  end
end