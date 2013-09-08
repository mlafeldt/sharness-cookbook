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
  let (:tmp_dir) { Chef::Config[:file_cache_path] }

  it 'creates a temporary directory to store build products' do
    chef_run.should create_directory tmp_dir
  end

  it 'downloads the sharness source tarball' do
    version = chef_run.node['sharness']['version']
    tarball = File.join(tmp_dir, "sharness-#{version}.tar.gz")
    chef_run.should create_remote_file tarball
  end

  it 'installs make' do
    chef_run.should install_package 'make'
  end

  it 'installs sharness' do
    chef_run.should execute_bash_script 'install sharness'
  end

  it 'sets up environment variables' do
    content = "export SHARNESS_PATH=\"#{chef_run.node['sharness']['path']}\""
    chef_run.should create_file_with_content '/etc/profile.d/sharness.sh', content
  end
end
