#
# Cookbook Name:: jc-base
# Recipe:: firefox
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'

package 'firefox' do
  default_release 'unstable'
end
