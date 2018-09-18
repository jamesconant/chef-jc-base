#
# Cookbook Name:: jc-base
# Recipe:: sonarr
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#
# Based on these instructions:
#   https://github.com/Sonarr/Sonarr/wiki/Installation#linux
#   https://github.com/Sonarr/Sonarr/wiki/Autostart-on-Debian
#

include_recipe 'jc-base::apt'
include_recipe 'jc-base::user'

package 'insserv'
package 'libmono-cil-dev'

user 'nzbdrone' do
  home '/home/nzbdrone'
  manage_home true
  system true
end

apt_repository 'nzbdrone' do
  uri 'http://apt.sonarr.tv/'
  distribution 'master'
  components ['main']
  key '0xFDA5DFFC'
end

package 'nzbdrone'

template '/etc/init.d/nzbdrone' do
  owner 'root'
  group 'root'
  mode 0777
  source '/etc/init.d/nzbdrone'
end

service "nzbdrone" do
  action [:enable, :restart]
end
