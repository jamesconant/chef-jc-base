#
# Cookbook Name:: jc-base
# Recipe:: keepassx
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'

package 'keepassx'
