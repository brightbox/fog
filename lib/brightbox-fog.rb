require 'rubygems'
require 'base64'
require 'cgi'
require 'excon'
require 'formatador'
require 'time'

__DIR__ = File.dirname(__FILE__)

$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require 'brightbox-fog/core'

module Fog

  @mocking = false

  unless const_defined?(:VERSION)
    VERSION = '0.3.16'
  end

  module Mock
    @delay = 1
    def self.delay
      @delay
    end

    def self.delay=(new_delay)
      raise ArgumentError, "delay must be non-negative" unless new_delay >= 0
      @delay = new_delay
    end

    def self.not_implemented
      raise Fog::Errors::MockNotImplemented.new("Contributions welcome!")
    end

  end

  def self.bin
    @bin ||= false
  end

  def self.bin=(new_bin)
    @bin = new_bin
  end

  def self.mock!
    @mocking = true
  end

  def self.mocking?
    !!@mocking
  end

  def self.wait_for(timeout=600, interval=1, &block)
    duration = 0
    start = Time.now
    until yield || duration > timeout
      sleep(interval)
      duration = Time.now - start
    end
    if duration > timeout
      false
    else
      { :duration => duration }
    end
  end

end

require 'brightbox-fog/aws'
require 'brightbox-fog/bluebox'
require 'brightbox-fog/brightbox'
require 'brightbox-fog/go_grid'
require 'brightbox-fog/linode'
require 'brightbox-fog/local'
require 'brightbox-fog/new_servers'
require 'brightbox-fog/rackspace'
require 'brightbox-fog/slicehost'
require 'brightbox-fog/terremark'
require 'brightbox-fog/vcloud'
require 'brightbox-fog/google'
