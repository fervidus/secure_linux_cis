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
            is_expected.to contain_file_line('net.ipv6.conf.all.disable_ipv6')
              .with(
                path:  '/etc/sysctl.conf',
                line:  'net.ipv6.conf.all.disable_ipv6 = 1',
                match: '^net.ipv6.conf.all.disable_ipv6.*',
              )
            is_expected.to contain_file_line('net.ipv6.conf.default.disable_ipv6')
              .with(
                path:  '/etc/sysctl.conf',
                line:  'net.ipv6.conf.default.disable_ipv6 = 1',
                match: '^net.ipv6.conf.default.disable_ipv6.*',
              )
          }
          it {
            is_expected.to contain_kernel_parameter('ipv6.disable=1').with(ensure: 'present')
          }
        else
          it {
            is_expected.not_to contain_file_line('net.ipv6.conf.all.disable_ipv6')
            is_expected.not_to contain_file_line('net.ipv6.conf.default.disable_ipv6')
            is_expected.not_to contain_kernel_parameter('ipv6.disable=1').with(ensure: 'present')
          }
        end
      end
    end
  end
end
