require 'fog/brightbox/models/compute/servers'
require 'fog/brightbox/models/compute/server'
require 'fog/brightbox/requests/compute/list_servers'
require 'fog/brightbox/requests/compute/create_server'
require 'fog/brightbox/requests/compute/get_server'
require 'fog/brightbox/requests/compute/destroy_server'

module Brightbox
  class << self

    if Fog.credentials[:brightbox_client_id] && Fog.credentials[:brightbox_secret]

      def initialized?
        true
      end

      def [](service)
        @@connections ||= Hash.new do |hash, key|
          hash[key] = case key
          when :compute
            Fog::Brightbox::Compute.new
          end
        end
        @@connections[service]
      end

      def services
        [:compute]
      end

      for collection in Fog::Brightbox::Compute.collections
        module_eval <<-EOS, __FILE__, __LINE__
          def #{collection}
            self[:compute].#{collection}
          end
        EOS
      end

    else

      def initialized?
        false
      end

    end
  end
end
