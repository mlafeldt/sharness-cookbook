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

tmp_dir = Chef::Config[:file_cache_path]
tarball = File.join(tmp_dir, "sharness-#{node['sharness']['version']}.tar.gz")

directory tmp_dir do
  recursive true
  action :create
  not_if "test -d #{tmp_dir}"
end

remote_file tarball do
  source node['sharness']['url']
  checksum node['sharness']['checksum']
  mode '0644'
  action :create
end

package 'make'

bash 'install sharness' do
  user 'root'
  cwd tmp_dir
  flags '-e'
  code <<-EOS
    tar xzf #{tarball}
    cd `tar -tf #{tarball} | head -n1`
    make install prefix=#{node['sharness']['prefix']}
    cd ..
    rm -rf `tar -tf #{tarball} | head -n1`
  EOS
end

template '/etc/profile.d/sharness.sh' do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  variables(
    :sharness_path => node['sharness']['path']
  )
end
