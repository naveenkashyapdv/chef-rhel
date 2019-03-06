require_relative 'resource_rhel_sub_manager'

class Chef
  class Resource
    class RhelRegistration < Chef::Resource::RhelSubManager
      def initialize(name, run_context=nil)
        super
        @resource_name = :rhel_registration
        @provider = Chef::Provider::RhelRegistration
        @action = :register
        @allowed_actions = [:register, :unregister]
      end

      def hostname(arg=nil)
        set_or_return(:name,
                      arg,
                      kind_of: String)
      end

      def username(arg=nil)
        set_or_return(:username,
                      arg,
                      kind_of: String)
      end

      def password(arg=nil)
        set_or_return(:password,
                      arg,
                      kind_of: String)
      end

      def serverurl(arg=nil)
        set_or_return(:serverurl,
                      arg,
                      kind_of: String)
      end

      def insecure(arg=nil)
        set_or_return(:insecure,
                      arg,
                      kind_of: [TrueClass, FalseClass],
                      default: false)
      end

      def baseurl(arg=nil)
        set_or_return(:baseurl,
                      arg,
                      kind_of: String)
      end

      def type(arg=nil)
        set_or_return(:type,
                      arg,
                      kind_of: String)
      end

      def org(arg=nil)
        set_or_return(:org,
                      arg,
                      kind_of: String)
      end

      def environment(arg=nil)
        set_or_return(:environment,
                      arg,
                      kind_of: String)
      end

      def release(arg=nil)
        set_or_return(:release,
                      arg,
                      kind_of: String)
      end

      def auto_attach(arg=nil)
        set_or_return(:auto_attach,
                      arg,
                      kind_of: [TrueClass, FalseClass])
      end

      def force(arg=nil)
        set_or_return(:force,
                      arg,
                      kind_of: [TrueClass, FalseClass])
      end

      def activationkey(arg=nil)
        set_or_return(:activationkey,
                      arg,
                      kind_of: String)
      end

      def servicelevel(arg=nil)
        set_or_return(:servicelevel,
                      arg,
                      kind_of: String)
      end
    end
  end
end
