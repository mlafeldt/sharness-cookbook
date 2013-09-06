#
# Cookbook Name:: sharness
# Attributes:: default
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

sharness_version = '0.3.0'

default['sharness']['version']     = sharness_version
default['sharness']['git']['repo'] = 'git://github.com/mlafeldt/sharness.git'
default['sharness']['git']['ref']  = "v#{sharness_version}"
default['sharness']['prefix']      = '/usr/local'