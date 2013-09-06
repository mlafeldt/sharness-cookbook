# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box       = 'jimdo-ubuntu-12.10'
  config.vm.box_url   = 'https://jimdo-vagrant-boxes.s3.amazonaws.com/jimdo-ubuntu-12.10.box'
  config.vm.host_name = 'sharness-ubuntu'

  # Enable Berkshelf plugin which will make cookbooks available to Vagrant
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'sharness::default'

    chef.json = {}
    chef.log_level = :debug
  end
end
