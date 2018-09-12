#
# Cookbook Name:: jc-base
# Recipe:: nouveau
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jc-base::apt'

package 'xserver-xorg-video-nouveau'
package 'libgl1-mesa-dri'


