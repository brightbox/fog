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

      # Singular links
      [:account, :image, :server_type, :zone].each do |link|
        attribute link, :squash => "id"
        # attribute :"#{link}_hash", :aliases => "#{link}", :squash => true
        # define_method(:"#{link}_id") { self.send(link).respond_to?(:index) ? self.send(link).index("id") : nil }
        # define_method(link) do
        #   puts "would do:\nrequires :#{link}_id\nconnection.#{link}.get(@#{link}_id)"
        # end
      end

      attribute :image_id, :aliases => "image", :squash => "id"
      attribute :flavor_id, :aliases => "server_type", :squash => "id"

      # Fog required
      # def flavor_id
      #   @flavor_id # ||= attributes["server_type"]["id"]
      # end
      # 
      # def flavor_id=(new_flavor)
      #   attributes["flavor_id"] = new_flavor
      #   @flavor_id = new_flavor
      # end
      # 
      # def image_id
      #   @image_id # ||= attributes["image"]["id"]
      # end
      # 
      # def image_id=(new_image)
      #   attributes["image_id"] = new_image
      #   @image_id = new_image
      # end


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