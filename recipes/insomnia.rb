#
# Cookbook Name:: jc-base
# Recipe:: insomnia
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'

apt_repository 'insomnia' do
  uri 'https://dl.bintray.com/getinsomnia/Insomnia'
  distribution '/'
  key 'https://insomnia.rest/keys/debian-public.key.asc'
end

package 'insomnia'
