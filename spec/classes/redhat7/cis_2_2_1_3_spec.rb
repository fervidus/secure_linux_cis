require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_2_2_1_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'time_servers' => ['time.example.com'], 'time_sync' => 'chrony' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_class('chrony')
              .with(
                servers: ['time.example.com'],
              )
            is_expected.to contain_file('/etc/sysconfig/chronyd')
              .with(
                ensure: 'file',
                owner: 'root',
                group: 'root',
                mode: '0644',
                content: 'OPTIONS="-u chrony"',
              )
          }
        else
          it {
            is_expected.not_to contain_class('chrony')
            is_expected.not_to contain_file('/etc/sysconfig/chronyd')
          }
        end
      end
    end
  end
end
