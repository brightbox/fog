require 'nokogiri'
require 'brightbox-fog/core/parser'

module Fog
  module Slicehost

    extend Fog::Provider

    service_path 'brightbox-fog/slicehost'
    service :compute

    def self.new(attributes = {})
      location = caller.first
      warning = "[yellow][WARN] Fog::Slicehost#new is deprecated, use Fog::Slicehost::Compute#new instead[/]"
      warning << " [light_black](" << location << ")[/] "
      Formatador.display_line(warning)
      Fog::Slicehost::Compute.new(attributes)
    end

  end
end
