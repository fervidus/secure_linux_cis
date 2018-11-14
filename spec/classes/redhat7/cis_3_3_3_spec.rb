require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_3_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'ipv6_enabled' => false } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_sysctl('net.ipv6.conf.all.disable_ipv6')
              .with(
                value: 1,
              )
            is_expected.to contain_sysctl('net.ipv6.conf.default.disable_ipv6')
              .with(
                value: 1,
              )
          }
        else
          it {
            is_expected.not_to contain_sysctl('net.ipv6.conf.all.disable_ipv6')
            is_expected.not_to contain_sysctl('net.ipv6.conf.default.disable_ipv6')
          }
        end
      end
    end
  end
end
