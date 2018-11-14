require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_6_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_firewall('001 accept all input to lo interface')
              .with(
                chain: 'INPUT',
                proto: 'all',
                iniface: 'lo',
                action: 'accept',
              )
            is_expected.to contain_firewall('002 accept all output to lo interface')
              .with(
                chain: 'OUTPUT',
                proto: 'all',
                outiface: 'lo',
                action: 'accept',
              )
            is_expected.to contain_firewall('003 drop all to lo 127.0.0.0/8')
              .with(
                chain: 'INPUT',
                proto: 'all',
                source: '127.0.0.0/8',
                action: 'drop',
              )
          }
        else
          it {
            is_expected.not_to contain_firewall('001 accept all input to lo interface')
            is_expected.not_to contain_firewall('002 accept all output to lo interface')
            is_expected.not_to contain_firewall('003 drop all to lo 127.0.0.0/8')
          }
        end
      end
    end
  end
end
