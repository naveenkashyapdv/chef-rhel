require_relative 'resource_rhel_sub_manager'

class Chef
  class Resource
    class RhelSubscription < Chef::Resource::RhelSubManager
      def initialize(name, run_context=nil)
        super
        @resource_name = :rhel_subscription
        @provider = Chef::Provider::RhelSubscription
        @action = :attach
        @allowed_actions = [:attach, :remove]
      end

      def pool(arg=nil)
        set_or_return(:pools,
                      arg,
                      kind_of: Array)
      end

      def quantity(arg=nil)
        set_or_return(:quantity,
                      arg,
                      kind_of: Integer)
      end

      def auto(arg=nil)
        set_or_return(:auto,
                      arg,
                      kind_of: [TrueClass, FalseClass],
                      default: false)
      end

      def serial(arg=nil)
        set_or_return(:serial,
                      arg,
                      kind_of: Array)
      end

      def servicelevel(arg=nil)
        set_or_return(:servicelevel,
                      arg,
                      kind_of: String)
      end

      def all(arg=nil)
        set_or_return(:all,
                      arg,
                      kind_of: [TrueClass, FalseClass],
                      default: true)
      end
    end
  end
end
