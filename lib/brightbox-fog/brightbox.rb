module Fog
  module Brightbox
    extend Fog::Provider
    service_path 'brightbox-fog/brightbox'
    service 'compute'
  end
end