#
# Cookbook Name:: jc-base
# Recipe:: google-chrome
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'

apt_repository 'google-chrome' do
  uri 'http://dl.google.com/linux/chrome/deb/'
  distribution ''
  components ['stable', 'main']
  key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
end

package 'google-chrome-stable'
