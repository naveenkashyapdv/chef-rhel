default_action :register
actions :register, :unregister, :subscribe, :unsubscribe

attribute :name, kind_of: String, name_attribute: true
attribute :user, kind_of: String, required: true
attribute :password, kind_of: String, required: true
attribute :url, kind_of: String
attribute :auto_attach, kind_of: [TrueClass, FalseClass]
attribute :org, kind_of: String
attribute :environment, kind_of: String
attribute :release, kind_of: String
attribute :force, kind_of: [TrueClass, FalseClass]
