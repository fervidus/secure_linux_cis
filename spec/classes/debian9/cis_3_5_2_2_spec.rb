require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::debian9::cis_3_5_2_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_firewall('001 IPv6 accept all input to lo interface')
              .with(
                chain: 'INPUT',
                proto: 'all',
                iniface: 'lo',
                action: 'accept',
                provider: 'ip6tables',
              )
            is_expected.to contain_firewall('002 IPv6 accept all output to lo interface')
              .with(
                chain: 'OUTPUT',
                proto: 'all',
                outiface: 'lo',
                action: 'accept',
                provider: 'ip6tables',
              )
            is_expected.to contain_firewall('003 IPv6 drop all to lo ::/0')
              .with(
                chain: 'INPUT',
                proto: 'all',
                source: '::1',
                action: 'drop',
                provider: 'ip6tables',
              )
          }
        else
          it {
            is_expected.not_to contain_firewall('001 IPv6 accept all input to lo interface')
            is_expected.not_to contain_firewall('002 IPv6 accept all output to lo interface')
            is_expected.not_to contain_firewall('003 IPv6 drop all to lo ::/0')
          }
        end
      end
    end
  end
end
