module Fog
  class Storage

    def self.new(attributes)
      case attributes.delete(:provider)
      when 'AWS'
        require 'brightbox-fog/aws'
        Fog::AWS::Compute.new(attributes)
      when 'Bluebox'
        require 'brightbox-fog/bluebox'
        Fog::Bluebox::Compute.new(attributes)
      when 'Brightbox'
        require 'brightbox-fog/brightbox'
        Fog::Brightbox::Compute.new(attributes)
      when 'GoGrid'
        require 'brightbox-fog/go_grid'
        Fog::GoGrid::Compute.new(attributes)
      when 'Linode'
        require 'brightbox-fog/linode'
        Fog::Linode::Compute.new(attributes)
      when 'NewServers'
        require 'brightbox-fog/new_servers'
        Fog::NewServers::Compute.new(attributes)
      when 'Rackspace'
        require 'brightbox-fog/rackspace'
        Fog::Rackspace::Compute.new(attributes)
      when 'Slicehost'
        require 'brightbox-fog/slicehost'
        Fog::Slicehost::Compute.new(attributes)
      else
        raise ArgumentError.new("#{provider} is not a recognized storage provider")
      end
    end

  end
end