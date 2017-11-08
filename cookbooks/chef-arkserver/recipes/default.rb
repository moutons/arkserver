#
# Cookbook:: chef-arkserver
# Recipe:: default
#
# Author:: Nick Gray (f0rkz@f0rkznet.net)
#
# Copyright:: 2017 f0rkznet.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# lib32gcc1 required for steamcmd api
package 'lib32gcc1'
package 'git'
package 'wget'
# package 'python3'
# package 'python3-pip'

execute 'reload systemd' do
  command 'systemctl daemon-reload'
  action :nothing
end

ark_base_dir = node['ark']['install_dir'] + '/' + node['ark']['appid']
ark_config_dir = ark_base_dir + '/ShooterGame/Saved/Config/LinuxServer'
gameusersettings_ini = ark_config_dir + '/GameUserSettings.ini'
game_ini = ark_config_dir + '/Game.ini'

user node['steam']['user'] do
  system true
  home node['steam']['steamcmd']['install_dir']
  shell '/bin/bash'
  action :create
end

if node['ark']['gameserver']['cluster']['is_enabled']
  cluster_directory = ark_base_dir + '/cluster'
  cluster_maps = node['ark']['gameserver']['cluster']['maps']
  query_port = node['ark']['gameserver']['cluster']['BaseQueryPort']
  listen_port = node['ark']['gameserver']['cluster']['BaseListenPort']

  directory cluster_directory do
    owner node['steam']['user']
    group node['steam']['user']
    mode '0755'
    recursive true
    action :create
  end

  cluster_maps.each do |map_name|
    # Create a game directory for each map_name
    map_dir = ark_base_dir + '/' + map_name
    ark_config_dir = map_dir + '/ShooterGame/Saved/Config/LinuxServer'
    gameusersettings_ini = ark_config_dir + '/GameUserSettings.ini'
    game_ini = ark_config_dir + '/Game.ini'

    directory map_dir do
      owner node['steam']['user']
      group node['steam']['user']
      mode '0755'
      recursive true
      action :create
      notifies :install, "steamcmd_app[install ark #{map_name}]", :immediately
    end

    # Install the server for each map_name
    steamcmd_app "install ark #{map_name}" do
      base_game_dir map_dir
      user node['steam']['user']
      group node['steam']['user']
      appid node['ark']['appid']
      action :nothing
    end

    directory ark_config_dir do
      owner node['steam']['user']
      group node['steam']['user']
      mode '0755'
      recursive true
      action :create
      notifies :run, "execute[chown ark]", :immediately
    end

    template gameusersettings_ini do
      source 'arkcluster/GameUserSettings.ini.erb'
      owner node['steam']['user']
      group node['steam']['user']
      mode '0400'
      variables({
        SessionName: node['ark']['gameserver']['cluster']['ClusterSessionName'] + map_name
      })
    end

    template game_ini do
      source 'ark/Game.ini.erb'
      owner node['steam']['user']
      group node['steam']['user']
      mode '0400'
    end

    template "/etc/systemd/system/ark-#{map_name}.service" do
      source 'ark-cluster.service.erb'
      owner 'root'
      group 'root'
      mode '0744'
      variables({
        map: map_name,
        listen_port: listen_port,
        query_port: query_port,
        cluster_directory: cluster_directory
      })
      notifies :enable, "service[ark-#{map_name}]", :immediately
      notifies :run, 'execute[reload systemd]', :delayed
      notifies :start, "service[ark-#{map_name}]", :delayed
    end

    service "ark-#{map_name}" do
      supports status: true
      action :nothing
    end

    # Incriment the query_port and listen_port
    query_port += 1
    listen_port += 1
  end

else
  # Do other things for a single server instance instead
  # Create the gameserver install directory
  directory node['ark']['install_dir'] do
    owner node['steam']['user']
    group node['steam']['user']
    mode '0755'
    recursive true
    action :create
    notifies :install, 'steamcmd_app[install ark]', :immediately
  end

  steamcmd_app 'install ark' do
    base_game_dir node['ark']['install_dir']
    user node['steam']['user']
    group node['steam']['user']
    appid node['ark']['appid']
    action :nothing
  end

  directory ark_config_dir do
    owner node['steam']['user']
    group node['steam']['user']
    mode '0755'
    recursive true
    action :create
    notifies :run, 'execute[chown ark]', :immediately
  end

  template gameusersettings_ini do
    source 'ark/GameUserSettings.ini.erb'
    owner node['steam']['user']
    group node['steam']['user']
    mode '0400'
  end

  template game_ini do
    source 'ark/Game.ini.erb'
    owner node['steam']['user']
    group node['steam']['user']
    mode '0400'
  end

  template '/etc/systemd/system/ark.service' do
    source 'ark.service.erb'
    owner 'root'
    group 'root'
    mode '0744'
    notifies :enable, 'service[ark]', :immediately
    notifies :run, 'execute[reload systemd]', :delayed
    notifies :start, 'service[ark]', :delayed
  end

  service 'ark' do
    supports status: true
    action :nothing
  end
end

execute 'chown ark' do
  command <<-EOF
  chown -R #{node['steam']['user']}:#{node['steam']['user']} #{ark_base_dir}
  EOF
  action :nothing
end
