#
# Cookbook Name:: jc-base
# Recipe:: bash
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::user'

desktop_user = node['desktop']['user']['name']
desktop_group = node['desktop']['user']['group']

template "/home/#{desktop_user}/.bashrc" do 
  owner desktop_user
  group desktop_group
  source "home/bash/bashrc"
  sensitive true # this is only done to silence output to terminal
end
