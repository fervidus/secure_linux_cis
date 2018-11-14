require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_6_5' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_firewall('010 open ssh port')
              .with(
                chain: 'INPUT',
                dport: '22',
                state: 'NEW',
                action: 'accept',
                proto: 'tcp',
              )
          }
        else
          it {
            is_expected.not_to contain_firewall('010 open ssh port')
          }
        end
      end
    end
  end
end
