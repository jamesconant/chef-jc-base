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
  source '/etc/init.d/nzbdrone'
end

[
  'chmod +x /etc/init.d/nzbdrone',
  'update-rc.d nzbdrone defaults',
  'useradd --system nzbdrone',
  'mkdir /home/nzbdrone',
  'chmod 770 /opt/NzbDrone -R',
  'chmod 770 /home/nzbdrone -R',
  'chown nzbdrone:nzbdrone /opt/NzbDrone -R',
  'chown nzbdrone:nzbdrone /home/nzbdrone -R'
].each { |cmd| execute cmd }

service "nzbdrone" do
  action :restart
end
