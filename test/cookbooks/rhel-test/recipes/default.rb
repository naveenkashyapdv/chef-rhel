include_recipe 'rhel'

rhel_registration 'test-server' do
  username node['rhel-test']['username']
  password node['rhel-test']['password']
  action [:register]
  auto_attach true
end

rhel_subscription 'subscribe_to_all' do
  action [:attach]
end

rhel_registration 'remove_test_server' do
  action [:unregister]
end
