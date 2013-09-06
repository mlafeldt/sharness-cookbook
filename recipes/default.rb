#
# Cookbook Name:: sharness
# Recipe:: default
#
# Copyright (C) 2013 Mathias Lafeldt <mathias.lafeldt@gmail.com>
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

tmp_dir = File.join(Chef::Config[:file_cache_path], 'sharness')

directory tmp_dir do
  recursive true
  action :create
  not_if "test -d #{tmp_dir}"
end

git tmp_dir do
  repository node['sharness']['git']['repo']
  reference node['sharness']['git']['ref']
  action :sync
end

execute 'install Sharness' do
  user 'root'
  cwd tmp_dir
  command "make install prefix=#{node['sharness']['prefix']}"
end