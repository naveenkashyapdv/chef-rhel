require 'chef/provider'
require_relative 'helpers'

class Chef
  class Provider
    class RhelRegistration < Chef::Provider
      include Rhel::Helpers

      def load_current_resource
        @current_resource ||= Chef::Resource::RhelRegistration.new(new_resource.name)
        @current_resource
      end

      def action_register
        if registered?
          new_resource.updated_by_last_action false
        else
          @valid_options = %w(username
                              password
                              serverurl
                              baseurl
                              org
                              environment
                              release
                              proxy
                              proxyuser
                              activationkey
                              proxypassword)

          opts = attr_options + flag_options
          # throw error if autoattach is not set and servicelevel is
          unless new_resource.servicelevel.nil?
            if new_resource.auto_attach
              opts << " --servicelevel=\"#{new_resource.servicelevel}\""
            else
              Chef::Application.fatal! 'using servicelevel requires auto_attach to be true'
            end
          end
          sub_management('register', opts)
          new_resource.updated_by_last_action true
        end
      end

      def action_unregister
        if registered?
          @valid_options = %w(proxy
                              proxyuser
                              proxypassword)
          sub_management('unregister', attr_options)
          new_resource.updated_by_last_action true
        else
          new_resource.updated_by_last_action false
        end
      end

      def attr_options
        return @attr_options unless @attr_options.nil?
        @attr_options = build_options(@valid_options).join(" ")
        @attr_options
      end

      # Returns all flag options as string
      def flag_options
        return @flag_options unless @flag_options.nil?
        @flag_options = ''
        @flag_options << ' --auto-attach' if new_resource.auto_attach
        @flag_options << ' --force' if new_resource.force
        @flag_options << ' --insecure' if new_resource.insecure
        @flag_options
      end
    end
  end
end
