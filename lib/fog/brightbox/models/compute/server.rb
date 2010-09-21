require 'fog/model'

module Fog
  module Brightbox
    class Server < Fog::Model

      identity  :id

      attribute :url
      attribute :name
      attribute :status
      attribute :hostname
      attribute :created_at, :type => :time
      attribute :deleted_at, :type => :time
      attribute :started_at, :type => :time
      attribute :user_data

      attribute :resource_type
      attribute :description

      attribute :account_id, :aliases => "account", :squash => "id"
      attribute :image_id, :aliases => "image", :squash => "id"
      attribute :flavor_id, :aliases => "server_type", :squash => "id"
      attribute :zone_id, :aliases => "zone", :squash => "id"

      # Plural links
      [:images, :cloud_ips, :interfaces].each do |link|
        attribute link
        # attribute :"#{link}_hash", :aliases => "#{link}"
        # define_method(link) do
        #   puts "(When correctly scoped...) would do:\nconnection.#{link}"
        # end
      end

      def reboot
        requires :identity
        raise "Not implemented"
      end

      def destroy
        requires :identity
        connection.destroy_server(identity)
        true
      end

      def flavor
        requires :flavor_id
        connection.flavors.get(@flavor_id)
      end

      def image
        requires :image_id
        connection.images.get(@image_id)
      end

      def ready?
        status == 'active'
      end

      def save
        requires :image_id
        options = { :server_type => @flavor_id, :image => @image_id }.delete_if {|k,v| v.nil? || v == "" }
        response = connection.create_server(options)
        data = JSON.parse(response.body)
        merge_attributes(data)
        true
      end

    end

  end
end