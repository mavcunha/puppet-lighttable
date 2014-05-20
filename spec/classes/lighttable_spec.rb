require 'spec_helper'

describe 'lighttable' do
  context 'no version given' do
    it { should contain_package('LightTable').with({
      :source => 'https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.6.5/LightTableMac.zip',
      :provider => 'compressed_app',
    })}
  end
  context 'version given' do
    let(:params) {{ :version => '0.6.0' }}
    it { should contain_package('LightTable').with({
      :source => 'https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.6.0/LightTableMac.zip',
      :provider => 'compressed_app',
    })}
  end
  describe 'creates link to light for cmd line' do
    it { should contain_file('/usr/local/bin/light').with({
      :ensure => 'link',
      :target => '/Applications/LightTable/light',
      :require => 'Package[LightTable]',
    })}
  end
  describe 'sets owner and group to LightTable directory' do
    let(:boxenuser) { 'github_user' }
    let(:facts) do
      {
        :boxen_user => 'boxenuser'
      }
    end
    it { should contain_file('/Applications/LightTable').with({
      :owner   => 'boxenuser',
      :group   => 'staff',
      :recurse => 'true',
      :require => 'Package[LightTable]',
    })}
  end
end
