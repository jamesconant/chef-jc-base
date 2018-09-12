#
# Cookbook Name:: jc-base
# Recipe:: user
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'
include_recipe 'desktop::user'

@desktop_user = node['desktop']['user']['name']
@desktop_group = node['desktop']['user']['group']
