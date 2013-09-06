require 'chef_bones/integration_spec_helper'

describe 'The recipe sharness::default' do
  let (:prefix) { '/usr/local' }

  it 'installs sharness' do
    expect(file "#{prefix}/share/sharness/sharness.sh").to be_file
    expect(file "#{prefix}/share/sharness/aggregate-results.sh").to be_file
  end

  it 'installs documentation' do
    expect(file "#{prefix}/share/doc/sharness/README.md").to be_file
    expect(file "#{prefix}/share/doc/sharness/COPYING").to be_file
  end

  it 'installs working examples' do
    expect(file "#{prefix}/share/doc/sharness/examples/Makefile").to be_file
    expect(command "sudo make -C #{prefix}/share/doc/sharness/examples").to return_exit_status 0
  end
end
