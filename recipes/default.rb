#
# Cookbook:: logwatch
# Recipe:: default
#
# Copyright:: 2009-2019, Chef Software, Inc.
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

include_recipe 'perl::default'

package 'logwatch'

# Configure logwatch email daily report
template '/etc/logwatch/conf/logwatch.conf' do
  source 'logwatch.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    directives: node['logwatch']['directives']
  )
end

# Add an ignore.conf file
template '/etc/logwatch/conf/ignore.conf' do
  source 'ignore.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    ignores: node['logwatch']['ignores']
  )
end
