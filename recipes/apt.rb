#
# Cookbook Name:: jc-base
# Recipe:: apt
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

apt_preference 'stable' do
  glob '*'
  pin "release n=#{node[:lsb][:codename]}"
  pin_priority '700'
end

apt_preference 'unstable' do
  glob '*'
  pin 'release n=unstable'
  pin_priority '200'
end

apt_preference 'experimental' do
  glob '*'
  pin 'release n=experimental'
  pin_priority '100'
end

template '/etc/apt/sources.list' do
  owner 'root'
  group 'root'
  source 'home/apt/sources.list'
end

execute 'apt-get update'

package 'dirmngr'
package 'apt-transport-https'
