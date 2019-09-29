require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_7' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) do
          os_facts.merge(
            'networking' => { 'interfaces' => { 'wlan1' => { 'mac' => 'de:ad:be:ef:00:00' } } },
          )
        end
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_exec('Disable wireless network interface: wlan1')
          }
        else
          it {
            is_expected.not_to contain_exec('Disable wireless network interface: wlan1')
          }
        end
      end
    end
  end
end
