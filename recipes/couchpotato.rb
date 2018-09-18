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

user 'couchpotato' do
  home '/home/couchpotato'
  manage_home true
  system true
end

directory '/opt/couchpotato' do
  owner 'couchpotato'
  group 'couchpotato'
  mode '770'
  action :create
end

git '/opt/couchpotato' do
  repository 'https://github.com/CouchPotato/CouchPotatoServer.git'
  revision 'master'
  action :sync
  user 'couchpotato'
  group 'couchpotato'
end

python_package 'pyopenssl'

file '/etc/init.d/couchpotato' do
  owner 'root'
  group 'root'
  mode 0777
  content ::File.open('/opt/couchpotato/init/ubuntu').read
  action :create
end

service "couchpotato" do
  action [:enable, :restart]
end
