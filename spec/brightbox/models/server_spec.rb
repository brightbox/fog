require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/../../shared_examples/server_examples'

describe 'Fog::Brightbox::Compute::Server' do

  it_should_behave_like "Server"

  subject {
    @image_id   = 'img-1mioz' # ubuntu-lucid-32-base
    @server = @servers.new(:image_id => @image_id)
  }

  before(:each) do
    @servers = Brightbox[:compute].servers
  end

  after(:each) do
    if @server && !@server.new_record?
      @server.wait_for { ready? }
      @server.destroy.should be_true
    end
  end

end
