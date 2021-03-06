require "log4r"

module VagrantPlugins
  module ProviderBhyve
    module Action
      class ForwardPort

	def initialize(app, env)
	  @logger = Log4r::Logger.new("vagrant_bhyve::action::forward_port")
	  @app = app
	end

	def call(env)
	  @machine	= env[:machine]
	  @driver	= @machine.provider.driver

	  env[:ui].info I18n.t('vagrant_bhyve.action.forward_ports')
	  tap_device 	= @driver.get_attr('tap')
	  @env[:forwarded_ports].each do |item|
	    forward_information = {
	      adapter: item[:adapter] || 'em0',
	      guest_port: item[:guest],
	      host_port: item[:host]
	    }
	    @driver.forward_port(forward_information, tap_device)
	  end
	  @app.call(env)
	end

      end
    end
  end
end
