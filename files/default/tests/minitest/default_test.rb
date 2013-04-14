require File.expand_path('../support/helpers', __FILE__)

describe 'strongspace::default' do

  include Helpers::Strongspace

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'should install the strongpace gem' do
  	assert_file "/usr/local/bin/strongspace", "root", "root", "755"
  end

  it 'should create a public key for root' do
  	assert_file "/root/.ssh/id_dsa.pub", "root", "root", "644"
  end

  it 'should create a private key for root' do
  	assert_file "/root/.ssh/id_dsa", "root", "root", "600"
  end

  it "installs mailutils" do
      package("mailutils").must_be_installed
  end

  it "installs the strongspace cronjob" do
  	assert_file "/etc/cron.daily/strongspace-rsync", "root", "root", "750"
  end

  it "installs a known hosts file for root" do
  	assert_file "/root/.ssh/known_hosts", "root", "root", "644"
  end

end
