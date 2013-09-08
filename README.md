Sharness Cookbook
=================

This cookbook installs [Sharness], the "Shell library to test your Unix tools
like Git does".

Requirements
------------

### Platform:

* Ubuntu
* Debian
* probably many more

### Cookbooks:

No dependencies

Attributes
----------

* `default['sharness']['version']` - The version of Sharness to install.
* `default['sharness']['url']` - URL to download Sharness source tarball from.
* `default['sharness']['checksum']` - Checksum of source tarball.
* `default['sharness']['prefix']` - Path prefix for installation.

See `attributes/default.rb` for default values.

Recipes
-------

### sharness::default

Installs Sharness.

This recipe can be run without any configuration. You might want to set
`node['sharness']['version']` to a specific version of Sharness to install.

Testing
-------

This cookbook utilizes [chef-bones] for testing. Everything you need to know
about testing this cookbook is explained [here][chef-bones-testing].

[![Build Status](https://travis-ci.org/mlafeldt/sharness-cookbook.png?branch=master)](https://travis-ci.org/mlafeldt/sharness-cookbook)

License and Author
------------------

Author:: Mathias Lafeldt (<mathias.lafeldt@gmail.com>)

Copyright:: 2013, Mathias Lafeldt

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[Sharness]: https://github.com/mlafeldt/sharness
[chef-bones-testing]: https://github.com/mlafeldt/chef-bones/blob/master/TESTING.md
[chef-bones]: https://github.com/mlafeldt/chef-bones
