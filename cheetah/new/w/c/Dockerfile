FROM chef_solo:latest
MAINTAINER Ivan Lopes <ivan (at) 42algoritmos (dot) com (dot) br>

# chef-solo
# ---------

RUN mkdir -p\
  /etc/chef \
  /root/.chef \
  /root/.chef/syntax_check_cache \
  /var/chef/roles        \
  /var/chef/checksums    \
  /var/chef/environments \
  /var/chef/backup       \
  /var/chef/cache

# add nodes
ADD src/nodes/node.json  /var/chef/node.json

# add roles
ADD src/roles/superuser.json /var/chef/roles/superuser.json

# Add latest default chef-solo config files
ADD src/client.rb                      /etc/chef/client.rb
ADD src/solo.rb                        /etc/chef/solo.rb
ADD src/knife.rb                       /root/.chef/knife.rb
ADD src/pem/admin.pem                  /etc/chef/admin.pem
ADD src/pem/chef-validator.pem         /etc/chef/chef-validator.pem
ADD src/keys/encrypted_data_bag_secret /etc/chef/encrypted_data_bag_secret

ADD src/chef-initialize.sh /usr/local/bin/chef-initialize.sh
RUN chmod +x               /usr/local/bin/chef-initialize.sh

# copy supervisor conf
ADD src/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
