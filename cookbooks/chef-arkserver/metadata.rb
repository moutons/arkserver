name 'chef-arkserver'
maintainer 'Nick Gray'
maintainer_email 'f0rkz@f0rkznet.net'
license 'Apache-2.0'
description 'Installs and Configures Ark Survival Evolved Dedicated Server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.6.1'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/f0rkz/chef-arkserver/issues'
source_url 'https://github.com/f0rkz/chef-arkserver'
depends 'chef-steamcmd'

%w(ubuntu debian).each do |os|
  supports os
end
