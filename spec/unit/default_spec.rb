require 'chef_bones/unit_spec_helper'

describe 'The recipe sharness::default' do
  let (:chef_run) do
    chef_run = ChefSpec::ChefRunner.new(
      :platform      => 'ubuntu',
      :version       => '12.04',
      :log_level     => :error,
      :cookbook_path => COOKBOOK_PATH
    )
    Chef::Config.force_logger true
    chef_run.converge 'sharness::default'
    chef_run
  end

  it 'installs Sharness'
end
