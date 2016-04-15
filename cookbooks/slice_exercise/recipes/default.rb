#
# Cookbook Name:: slice_exercise
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package 'nginx'
package 'tomcat7'


file 'usr/share/nginx/html/index.html' do 
	action :delete 
end

template '/etc/nginx/sites-available/default' do
  source 'default.erb'
  owner "root"
  group "root"
  mode 0644
end

service 'nginx' do
  supports :status => true
  action [:enable, :start]
end


service 'tomcat7' do
  supports :status => true
  action [:enable, :start]
end
