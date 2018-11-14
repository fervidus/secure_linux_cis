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
            is_expected.to contain_sysctl('net.ipv6.conf.all.accept_redirects')
              .with(
                value: 0,
              )
            is_expected.to contain_sysctl('net.ipv6.conf.default.accept_redirects')
              .with(
                value: 0,
              )
          }
        else
          it {
            is_expected.not_to contain_sysctl('net.ipv6.conf.all.accept_redirects')
            is_expected.not_to contain_sysctl('net.ipv6.conf.default.accept_redirects')
          }
        end
      end
    end
  end
end
