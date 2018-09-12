#
# Cookbook Name:: jc-base
# Recipe:: default
#
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

# Debugging
# chef_gem 'pry'
# require 'pry'

# This workbook only supports Debian
unless node['platform'] == 'debian'
  raise "Unsupported platform: #{node['platform']}"
end

# Halt run of recipes if not on a reasonably modern kernel. There is probably a
# less stupid way to do this.
if `uname -r`[0].to_i < 4
  raise StandardError,
        'Please upgrade to a somewhat modern kernel, such as 4.x'
end

include_recipe 'jc-base::apt'
include_recipe 'jc-base::git'
include_recipe 'jc-base::vim'
include_recipe 'jc-base::user'

include_recipe 'jc-base::couchpotato'
include_recipe 'jc-base::dbeaver'
include_recipe 'jc-base::firefox'
include_recipe 'jc-base::google-chrome'
include_recipe 'jc-base::inkscape'
include_recipe 'jc-base::insomnia'
include_recipe 'jc-base::kde'
include_recipe 'jc-base::keepassx'
include_recipe 'jc-base::mumble'
include_recipe 'jc-base::nouveau'
include_recipe 'jc-base::plex'
include_recipe 'jc-base::sabnzbdplus'
include_recipe 'jc-base::slack'
include_recipe 'jc-base::sonarr'
include_recipe 'jc-base::spotify'
include_recipe 'jc-base::terminator'
include_recipe 'jc-base::vagrant'
include_recipe 'jc-base::virtualbox'
include_recipe 'jc-base::vscode'
