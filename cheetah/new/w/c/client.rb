log_level    :info
log_location STDOUT

chef_server_url        'https://chef:443'
validation_client_name 'chef-validator'
validation_key         '/etc/chef/chef-validator.pem'
node_name              'admin'

