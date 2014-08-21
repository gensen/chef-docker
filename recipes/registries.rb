# Recipe to add registries either from node attributes or data_bags
registries = node['docker']['registries']

registries.each do |registry|
  new_registry = if registry['data_bag']
    data_bag_item(registry['data_bag']['name'], registry['data_bag']['item'])
  else
    registry
  end

  docker_registry new_registry['url'] do
    username new_registry['username']
    password new_registry['password']
    email new_registry['email']
  end
end
