module Fog
  class Storage

    def self.new(attributes)
      case provider = attributes.delete(:provider)
      when 'AWS'
        require 'brightbox-fog/aws'
        Fog::AWS::Storage.new(attributes)
      when 'Google'
        require 'brightbox-fog/google'
        Fog::Google::Storage.new(attributes)
      when 'Local'
        require 'brightbox-fog/local'
        Fog::Local::Storage.new(attributes)
      when 'Rackspace'
        require 'brightbox-fog/rackspace'
        Fog::Rackspace::Storage.new(attributes)
      else
        raise ArgumentError.new("#{provider} is not a recognized storage provider")
      end
    end

  end
end
