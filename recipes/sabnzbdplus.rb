#
# Cookbook Name:: jc-base
# Recipe:: sabnzbdplus
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'
include_recipe 'jc-base::user'

package 'sabnzbdplus'

template '/etc/default/sabnzbdplus' do
  owner 'root'
  group 'root'
  source 'etc/default/sabnzbdplus'
end

service 'sabnzbdplus' do
  action :restart
end
