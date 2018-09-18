#
# Cookbook Name:: jc-base
# Recipe:: git
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'
include_recipe 'jc-base::user'

desktop_user = node['desktop']['user']['name']
desktop_group = node['desktop']['user']['group']

package 'git'

['gitconfig', 'git_bash_completion'].each do |file|
  template "/home/#{desktop_user}/.#{file}" do
    owner desktop_user
    group desktop_group
    source "home/git/#{file}"
    sensitive true # this is only done to silence output to terminal
  end
end
