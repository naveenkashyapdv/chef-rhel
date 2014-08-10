require 'chef/provider'
require_relative 'helpers'

class Chef
  class Provider
    class RhelSubscription < Chef::Provider
      include Rhel::Helpers

      def load_current_resource
        @current_resource ||= Chef::Resource::RhelSubscription.new(new_resource.name)
        @current_resource
      end

      # TODO: Make idempotent, probably implement a rhel subscription Ohai plugin
      def action_attach
        if registered?
          @valid_options = %w(proxy
                              proxyuser
                              proxypassword
                              quantity)

          opts = attr_options
          opts << '--auto' if new_resource.auto
          # throw error if autoattach is not set and servicelevel is
          unless new_resource.servicelevel.nil?
            if new_resource.auto
              opts << " --servicelevel=\"#{new_resource.servicelevel}\""
            else
              Chef::Application.fatal! 'using servicelevel requires auto to be true'
            end
          end

          opts << pools.join(' ') unless pools.empty? unless new_resource.auto
          sub_management('attach', opts)
          new_resource.updated_by_last_action true
        else
          Chef::Application.fatal! 'Node must be registered before you can attach subscriptions'
          new_resource.updated_by_last_action false
        end
      end

      def action_remove
        if registered?
          @valid_options = %w(proxy
                              proxyuser
                              proxypassword)
          opts = attr_options
          if serials.empty?
            opts << ' --all'
          else
            opts << serials.join(' ')
          end
          sub_management('remove', attr_options)
          new_resource.updated_by_last_action true
        else
          new_resource.updated_by_last_action false
        end
      end

      def serials
        return @serials unless @serials.nil?
        @serials = []
        unless new_resource.serial.nil?
          new_resource.serial.each do |serial|
            @serials.push "--serial=\"#{serial}\""
          end
        end
        @serials
      end

      def pools
        return @pools unless @pools.nil?
        @pools = []
        unless new_resource.pool.nil?
          new_resource.pool.each do |pool|
            @pools.push "--pool=\"#{pool}\""
          end
        end
        @pools
      end

      def attr_options
        return @attr_options unless @attr_options.nil?
        @attr_options = build_options(@valid_options).join(' ')
        @attr_options
      end
    end
  end
end
