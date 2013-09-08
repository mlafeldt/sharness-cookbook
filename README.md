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

* `node['sharness']['version']` - The version of Sharness to install.
* `node['sharness']['url']` - URL to download Sharness source tarball from.
* `node['sharness']['checksum']` - Checksum of source tarball.
* `node['sharness']['prefix']` - Path prefix for installation.
* `node['sharness']['path']` - Path to directory that holds Sharness library.

See `attributes/default.rb` for default values.

Recipes
-------

### sharness::default

Installs Sharness.

This recipe can be run without any configuration. You might want to set
`node['sharness']['version']` to install a specific version of Sharness.

The recipe also sets up the environment variable `SHARNESS_PATH` to point to
`node['sharness']['path']`, so you can easily source Sharness inside your tests:

```sh
#!/bin/sh

test_description="Some example test"

. "$SHARNESS_PATH/sharness.sh"
```

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
