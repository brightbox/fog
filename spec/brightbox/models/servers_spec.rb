require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/../../shared_examples/servers_examples'

describe 'Fog::Brightbox::Compute::Servers' do

  it_should_behave_like "Servers"

  subject {
    @image_id   = 'img-1mioz' # ubuntu-lucid-32-base
    @server = @servers.new(:image_id => @image_id)
    @server
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