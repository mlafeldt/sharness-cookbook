require 'chef_bones/integration_spec_helper'

describe 'sharness::default' do
  let (:prefix) { '/usr/local' }

  it 'installs sharness library' do
    expect(file "#{prefix}/share/sharness/sharness.sh").to be_file
  end

  it 'installs aggregate script' do
    expect(file "#{prefix}/share/sharness/aggregate-results.sh").to be_file
  end

  it 'installs documentation' do
    expect(file "#{prefix}/share/doc/sharness/README.md").to be_file
  end

  it 'sets up environment variables' do
    expect(file "/etc/profile.d/sharness.sh").to be_file
  end

  context 'test examples' do
    let (:examples) { "#{prefix}/share/doc/sharness/examples" }

    it 'are installed' do
      expect(file "#{examples}/Makefile").to be_file
    end

    it 'succeed when run with make test' do
      expect(command "sudo make test -C #{examples}").to return_exit_status 0
    end

    it 'succeed when run with make prove' do
      expect(command "sudo make prove -C #{examples}").to return_exit_status 0
    end
  end
end
