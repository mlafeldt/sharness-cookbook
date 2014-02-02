require "spec_helper"

describe "sharness::default" do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:tmp_dir) { Chef::Config[:file_cache_path] }

  before do
    stub_command("test -d #{tmp_dir}").and_return(true)
  end

  it "creates a temporary directory to store build products" do
    expect(chef_run).to create_directory(tmp_dir).with(:recursive => true)
  end

  it "downloads the sharness source tarball" do
    version = chef_run.node["sharness"]["version"]
    tarball = File.join(tmp_dir, "sharness-#{version}.tar.gz")
    expect(chef_run).to create_remote_file tarball
  end

  it "installs make" do
    expect(chef_run).to install_package "make"
  end

  it "installs sharness" do
    expect(chef_run).to run_bash "install sharness"
  end

  it "sets up environment variable SHARNESS_PATH" do
    content = "export SHARNESS_PATH=\"#{chef_run.node["sharness"]["path"]}\""
    expect(chef_run).to render_file("/etc/profile.d/sharness.sh")
      .with_content content
  end
end
