require 'brightbox-fog/core/collection'
require 'brightbox-fog/slicehost/models/compute/image'

module Fog
  module Slicehost
    class Compute

      class Images < Fog::Collection

        model Fog::Slicehost::Compute::Image

        def all
          data = connection.get_images.body['images']
          load(data)
        end

        def get(image_id)
          connection.get_image(image_id)
        rescue Excon::Errors::Forbidden
          nil
        end

      end

    end
  end
end
