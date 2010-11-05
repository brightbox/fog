require 'brightbox-fog/core/credentials'

module Fog
  class << self

    def providers
      [
        ::AWS,
        ::Bluebox,
        ::Brightbox,
        ::GoGrid,
        ::Google,
        ::Linode,
        ::Local,
        ::NewServers,
        ::Rackspace,
        ::Slicehost,
        ::Terremark
      ].select {|provider| provider.available?}
    end

    def modules
      [
        ::Vcloud
      ].select {|_module_| _module_.initialized?}
    end

  end

  class Bin
    class << self

      def available?
        availability = true
        for service in services
          begin
            service = eval(self[service].class.to_s.split('::')[0...-1].join('::'))
            availability &&= service.requirements.all? {|requirement| Fog.credentials.include?(requirement)}
          rescue
            availability = false
          end
        end

        if availability
          for service in services
            for collection in self[service].collections
              unless self.respond_to?(collection)
                self.class_eval <<-EOS, __FILE__, __LINE__
                  def self.#{collection}
                    self[:#{service}].#{collection}
                  end
                EOS
              end
            end
          end
        end

        availability
      end

      def collections
        services.map {|service| self[service].collections}.flatten.sort_by {|service| service.to_s}
      end

    end
  end

end

require 'brightbox-fog/aws/bin'
require 'brightbox-fog/bluebox/bin'
require 'brightbox-fog/brightbox/bin'
require 'brightbox-fog/go_grid/bin'
require 'brightbox-fog/google/bin'
require 'brightbox-fog/linode/bin'
require 'brightbox-fog/local/bin'
require 'brightbox-fog/new_servers/bin'
require 'brightbox-fog/rackspace/bin'
require 'brightbox-fog/slicehost/bin'
require 'brightbox-fog/terremark/bin'
require 'brightbox-fog/vcloud/bin'
