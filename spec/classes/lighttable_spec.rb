require 'spec_helper'

describe 'lighttable' do
  describe 'creates link to light for cmd line' do
    it { should contain_file('/usr/local/bin/light').with({
      :ensure => 'link',
      :target => '/Applications/LightTable/light',
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
      :group   => 'admin',
      :recurse => 'true',
    })}
  end
end
