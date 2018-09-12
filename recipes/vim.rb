#
# Cookbook Name:: jc-base
# Recipe:: vim
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'
include_recipe 'jc-base::user'

package 'vim'

template "/home/#{@desktop_user}/.vimrc" do
  owner @desktop_user
  group @desktop_group
  source 'home/vim/vimrc'
  sensitive true # this is only done to silence output to terminal
end
