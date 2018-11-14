require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_3_6_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_firewallchain('INPUT:filter:IPv4')
              .with(
                ensure: 'present',
                policy: 'drop',
              )
            is_expected.to contain_firewallchain('OUTPUT:filter:IPv4')
              .with(
                ensure: 'present',
                policy: 'drop',
              )
            is_expected.to contain_firewallchain('FORWARD:filter:IPv4')
              .with(
                ensure: 'present',
                policy: 'drop',
              )
          }
        else
          it {
            is_expected.not_to contain_firewallchain('INPUT:filter:IPv4')
            is_expected.not_to contain_firewallchain('OUTPUT:filter:IPv4')
            is_expected.not_to contain_firewallchain('FORWARD:filter:IPv4')
          }
        end
      end
    end
  end
end
