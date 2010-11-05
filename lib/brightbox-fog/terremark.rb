require 'nokogiri'
require 'brightbox-fog/core/parser'

require 'brightbox-fog/terremark/shared'
require 'brightbox-fog/terremark/parser'
require 'brightbox-fog/terremark/ecloud'
require 'brightbox-fog/terremark/vcloud'

module Fog
  module Terremark
    ECLOUD_OPTIONS = [:terremark_ecloud_username, :terremark_ecloud_password]
    VCLOUD_OPTIONS = [:terremark_vcloud_username, :terremark_vcloud_password]
  end
end
