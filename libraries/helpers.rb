require 'mixlib/shellout'
require 'chef'

module Rhel
  module Helpers
    @@subscription_manager = '/usr/bin/subscription-manager'

    # takes array of strings and returns an array of formatted options
    # using the resource attributes
    def build_options(opts)
      options = []
      opts.each do |opt|
        val = new_resource.send(opt.to_sym)
        options << "--#{opt}=\"#{val}\"" unless val.nil?
      end
      options
    end

    def registered?
      
      command = @@subscription_manager + ' identity'
      shellout = Mixlib::ShellOut.new(command, user: 'root').run_command
      if shellout.exitstatus == 0
        true
      else
        false
      end
    end

    def sub_management(mod, options=nil)
      command = @@subscription_manager + ' ' + mod + ' ' + options
      Chef::Log.debug("Running command #{command} as root")

      shellout = Mixlib::ShellOut.new(command, user: 'root').run_command
      unless shellout.stderr.empty? || returns (1)
        Chef::Application.fatal! "subscription-manager returned error #{shellout.stderr}"
      end
    end
  end
end
