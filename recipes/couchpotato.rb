#
# Cookbook Name:: jc-base
# Recipe:: couchpotato
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#
# Based on these instructions:
#   https://github.com/CouchPotato/CouchPotatoServer/
#

include_recipe 'jc-base::git'

package 'python2.7'
package 'python-pip'
package 'python-lxml' # maybe

[
  'useradd --system couchpotato',
  'mkdir /home/couchpotato',
  'mkdir /opt/couchpotato',
  'chmod 770 /opt/couchpotato -R',
  'chmod 770 /home/couchpotato -R',
  'chown couchpotato:couchpotato /opt/couchpotato -R',
  'chown couchpotato:couchpotato /home/couchpotato -R'
].each { |cmd| execute cmd }

git '/opt/couchpotato' do
  repository 'https://github.com/CouchPotato/CouchPotatoServer.git'
  revision 'master'
  action :sync
  user 'couchpotato'
  group 'couchpotato'
end

[
  'pip install --upgrade pyopenssl',
  'sudo cp /opt/couchpotato/init/ubuntu /etc/init.d/couchpotato',
  'chmod +x /etc/init.d/couchpotato',
  'update-rc.d couchpotato defaults',
  'chmod 770 /opt/couchpotato -R',
  'chmod 770 /home/couchpotato -R',
  'chown couchpotato:couchpotato /opt/couchpotato -R',
  'chown couchpotato:couchpotato /home/couchpotato -R'
].each { |cmd| execute cmd }

service "couchpotato" do
  action :restart
end
