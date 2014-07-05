include_recipe 'rhel'

rhel_subscription 'test-server' do
  user node['rhel-test']['username']
  password node['rhel-test']['password']
  action [:register]
end
