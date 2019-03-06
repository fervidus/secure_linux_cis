require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_2_2_1_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'time_servers' => ['time.example.com'] } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_class('ntp')
              .with(
                servers: ['time.example.com'],
                restrict: [
                  '-4 default kod nomodify notrap nopeer noquery',
                  '-6 default kod nomodify notrap nopeer noquery'
                ],
              )
            is_expected.to contain_file('/etc/sysconfig/ntpd')
              .with(
                ensure: 'file',
                owner: 'root',
                group: 'root',
                mode: '0644',
                content: 'OPTIONS="-u ntp:ntp"',
              )
          }
        else
          it {
            is_expected.not_to contain_class('ntp')
            is_expected.not_to contain_file('/etc/sysconfig/ntpd')
          }
        end
      end
    end
  end
end
