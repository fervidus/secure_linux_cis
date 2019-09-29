require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_3_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('net.ipv6.conf.all.accept_redirects')
              .with(
                path:  '/etc/sysctl.conf',
                line:  'net.ipv6.conf.all.accept_redirects = 0',
                match: '^net.ipv6.conf.all.accept_redirects.*',
              )
            is_expected.to contain_file_line('net.ipv6.conf.default.accept_redirects')
              .with(
                path:  '/etc/sysctl.conf',
                line:  'net.ipv6.conf.default.accept_redirects = 0',
                match: '^net.ipv6.conf.default.accept_redirects.*',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('net.ipv6.conf.all.accept_redirects')
            is_expected.not_to contain_file_line('net.ipv6.conf.default.accept_redirects')
          }
        end
      end
    end
  end
end
