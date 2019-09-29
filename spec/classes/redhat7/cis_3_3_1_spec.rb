require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_3_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('net.ipv6.conf.all.accept_ra')
              .with(
                path:  '/etc/sysctl.conf',
                line:  'net.ipv6.conf.all.accept_ra = 0',
                match: '^net.ipv6.conf.all.accept_ra.*',

              )
            is_expected.to contain_file_line('net.ipv6.conf.default.accept_ra')
              .with(
                path:  '/etc/sysctl.conf',
                line:  'net.ipv6.conf.default.accept_ra = 0',
                match: '^net.ipv6.conf.default.accept_ra.*',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('net.ipv6.conf.all.accept_ra')
            is_expected.not_to contain_file_line('net.ipv6.conf.default.accept_ra')
          }
        end
      end
    end
  end
end
