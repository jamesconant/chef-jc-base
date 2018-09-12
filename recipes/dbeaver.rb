#
# Cookbook Name:: jc-base
# Recipe:: dbeaver
# Copyright 2018, James Conant
#
# All rights reserved - Do Not Redistribute
#

package 'openjdk-8-jre-headless'

dbeaver_url =
    'https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb'

dbeaver_path =
    "#{Chef::Config[:file_cache_path]}/dbeaver-ce_latest_amd64.deb"

remote_file dbeaver_path do
  source dbeaver_url
  mode 0444
  checksum '786864543a343a4b64a4f46ded770e2ea039c72e2449e2f156034b9e33a66184'
end

dpkg_package 'dbeaver' do
  action :install
  source dbeaver_path
end
