#
# Cookbook Name:: jc-base
# Recipe:: google-chrome
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'

package 'dirmngr'

apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  components ['non-free']
  distribution 'stable'
  keyserver 'keyserver.ubuntu.com'
  key '931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90'
end

package 'spotify-client'
