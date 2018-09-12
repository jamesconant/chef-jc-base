#
# Cookbook Name:: jc-base
# Recipe:: vscode
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'

apt_repository 'spotify' do
  uri 'https://packages.microsoft.com/repos/vscode'
  components ['main']
  distribution 'stable'
  key 'https://packages.microsoft.com/keys/microsoft.asc'
end

package 'code'
