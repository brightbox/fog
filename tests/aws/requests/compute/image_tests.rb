Shindo.tests('AWS::Compute | image requests', ['aws']) do

  @images_format = {
    'imagesSet'    => [{
      'architecture'    => String,
      'blockDeviceMapping' =>[],
      'imageId'         => String,
      'imageLocation'   => String,
      'imageOwnerId'    => String,
      'imageState'      => String,
      'imageType'       => String,
      'isPublic'        => Fog::Boolean,
      'kernelId'        => String,
      'productCodes'    => [],
      'ramdiskId'       => String,
      'rootDeviceType'  => String
    }],
      'requestId'     => String,
  }

  tests('success') do

    # the result for this is HUGE an relatively uninteresting...de
    # tests("#describe_images").formats(@images_format) do
    #   AWS[:compute].describe_images.body
    # end

    tests("#describe_images('ImageId' => '#{GENTOO_AMI}')").formats(@images_format) do
      AWS[:compute].describe_images('ImageId' => GENTOO_AMI).body
    end

  end

  tests('failure') do

    tests("#describe_images('ImageId' => 'ami-00000000')").raises(Fog::AWS::Compute::Error) do
      AWS[:compute].describe_regions('ImageId' => 'ami-00000000')
    end
  end

end
