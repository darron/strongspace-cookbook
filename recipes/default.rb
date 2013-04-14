#
# Cookbook Name:: strongspace
# Recipe:: default
#

package "mailutils"

gem_package "strongspace"

template "/etc/cron.daily/strongspace-rsync" do
  source "strongspace-rsync.erb"
  owner "root"
  group "root"
  mode 0750
  variables(
    :username => node[:strongspace][:username],
    :hostname => node[:strongspace][:hostname],
    :path => node[:strongspace][:path],
    :directories => node[:strongspace][:directories],
    :command => node[:strongspace][:command]
  )
end

# The emailed key needs to be setup at Strongspace.
bash "create root ssh key" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    ssh-keygen -N '' -q -t dsa -f /root/.ssh/id_dsa
    mail #{node[:strongspace][:email]} -s "Backup Strongspace Key for #{node.name}" < /root/.ssh/id_dsa.pub
  EOH
  not_if { FileTest.exists?("/root/.ssh/id_dsa") }
end

template "/root/.ssh/known_hosts" do
  source "known_hosts.erb"
  owner "root"
  group "root"
  mode 0644
  not_if { FileTest.exists?("/root/.ssh/known_hosts") }
end