#
# Cookbook Name:: jc-base
# Recipe:: vagrant
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'
include_recipe 'jc-base::user'
include_recipe 'jc-base::virtualbox'
include_recipe 'desktop::vagrant'
