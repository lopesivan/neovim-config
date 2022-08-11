#root = File.absolute_path(File.dirname(__FILE__))
#json_attribs root  + '/nodes/node.json'
#json_attribs nil
#lockfile nil

log_level     :info
log_location  STDOUT

ssl_verify_mode    :verify_peer
rest_timeout 300

node_name 'admin'

validation_client_name 'chef-validator'
chef_server_url        'https://chef:443'
trusted_certs_dir      '~/.chef/trusted_certs'
validation_key         '/etc/chef/chef-validator.pem'

syntax_check_cache_path  '/root/.chef/syntax_check_cache'
client_key               '/etc/chef/admin.pem'

#solo false

checksum_path "/var/chef/checksums"

cookbook_path [
               '/var/chef/cookbooks',
               '/var/chef/site-cookbooks'
              ]

data_bag_path "/var/chef/data_bags"

#environment "production"
environment_path '/var/chef/environments'
file_backup_path '/var/chef/backup'
file_cache_path  '/var/chef/cache'
role_path        '/var/chef/roles'
json_attribs     '/var/chef/node.json'

encrypted_data_bag_secret_key_path '/etc/chef/encrypted_data_bag_secret'
