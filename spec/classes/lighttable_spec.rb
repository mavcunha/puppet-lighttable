require 'spec_helper'

describe 'lighttable' do
  context 'no version given' do
    it { should contain_package('lighttable').with({
      :source => 'https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.6.5/LightTableMac.zip',
      :provider => 'compressed_app',
    })}
  end
  context 'version given' do
    let(:params) {{ :version => '0.6.0' }}
    it { should contain_package('lighttable').with({
      :source => 'https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.6.0/LightTableMac.zip',
      :provider => 'compressed_app',
    })}
  end
end
