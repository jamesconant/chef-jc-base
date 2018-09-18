#
# Cookbook Name:: jc-base
# Recipe:: plex
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'
include_recipe 'jc-base::user'

desktop_user = node['desktop']['user']['name']

apt_repository 'plexmediaserver' do
  uri 'https://downloads.plex.tv/repo/deb'
  distribution './public'
  components ['main']
  key 'https://downloads.plex.tv/plex-keys/PlexSign.key'
end

package 'plexmediaserver'

plex_user_cfg = "\"PLEX_MEDIA_SERVER_USER=#{desktop_user}\""
execute "echo #{plex_user_cfg} >> /etc/default/plexmediaserver"

service "plexmediaserver" do
  action :restart
end
