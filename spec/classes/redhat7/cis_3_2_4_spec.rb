require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_2_4' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_sysctl('net.ipv4.conf.all.log_martians')
              .with(
                value: 1,
              )
            is_expected.to contain_sysctl('net.ipv4.conf.default.log_martians')
              .with(
                value: 1,
              )
          }
        else
          it {
            is_expected.not_to contain_sysctl('net.ipv4.conf.all.log_martians')
            is_expected.not_to contain_sysctl('net.ipv4.conf.default.log_martians')
          }
        end
      end
    end
  end
end
