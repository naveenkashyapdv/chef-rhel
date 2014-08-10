require 'chef/resource'

class Chef
  class Resource
    class RhelSubManager < Chef::Resource
      def initialize(name, run_context=nil)
        super
      end

      def proxy(arg=nil)
        set_or_return(:proxy,
                      arg,
                      kind_of: String)
      end

      def proxyuser(arg=nil)
        set_or_return(:proxyuser,
                      arg,
                      kind_of: String)
      end

      def proxypassword(arg=nil)
        set_or_return(:proxypassword,
                      arg,
                      kind_of: String)
      end
    end
  end
end
