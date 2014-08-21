# Recipe to add and start containers
containers = node['docker']['containers']

containers.each do |container|
  container['config'] ||= {}
  docker_container container['name'] do
    image container['repository']
    hostname container['hostname']
    detach container['config']['detached']
    port container['config']['port']
    env container['config']['env']
    volume container['config']['volume']
  end
end
