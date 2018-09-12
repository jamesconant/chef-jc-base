#
# Cookbook Name:: jc-base
# Recipe:: kde
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'

package 'kde-full' do
  default_release 'unstable'
  options '--force-yes'
end
