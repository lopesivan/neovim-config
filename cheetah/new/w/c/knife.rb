log_level     :info
log_location  STDOUT

node_name 'admin'

#ssl_verify_mode       :verify_peer
validation_client_name 'chef-validator'
chef_server_url        'https://chef:443'
trusted_certs_dir      '~/.chef/trusted_certs'
validation_key         '/etc/chef/chef-validator.pem'

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
#role_path       '/var/chef/roles'
#json_attribs    '/var/chef/node.json'

syntax_check_cache_path  '/root/.chef/syntax_check_cache'
client_key               '/etc/chef/admin.pem'

data_bag_path                      '/var/chef/data_bags'
encrypted_data_bag_secret_key_path '/etc/chef/encrypted_data_bag_secret'

cookbook_copyright '42algoritmos, Inc.'
cookbook_license   'apachev2'
cookbook_email     'ivan@42algoritmos.com.br'
