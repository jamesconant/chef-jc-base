# Would be good to be able to use ENV vars here instead of strings.
#
# Is it possible to have a user just for chef? Is it worth while? maybe not.
#

local_mode true
file_cache_path "/home/jconant/projects/tmp"
cookbook_path ["/home/jconant/projects/cookbooks"]
json_attribs "/home/jconant/projects/chef-jc-base/node.json"
