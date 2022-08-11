# `<chef-solo>`
# VERSION               0.1
# DOCKER-VERSION        $docker_version

FROM ivan/chef-solo:latest
MAINTAINER Ivan Lopes <ivan@42algoritmos.com.br>
$data
$data[0]
# chef-solo
# ---------

RUN mkdir -p\
  /etc/chef                 \
  /root/.chef               \
  /root/.chef/syntax_check_cache \
  /var/chef/checksums       \
  /var/chef/environments    \
  /var/chef/backup          \
  /var/chef/cache

# add nodes
ADD src/nodes/node.json  /var/chef/node.json

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
