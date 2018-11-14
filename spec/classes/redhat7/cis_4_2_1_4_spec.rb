require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_1_4' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging_host' => 'loghost.example.com' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('rsyslog.conf logging_host')
              .with(
                ensure: 'present',
                path: '/etc/rsyslog.conf',
                line: '*.* @@loghost.example.com',
                match: '\*\.\* @@',
              )
            is_expected.to contain_exec('reload rsyslog 4_2_1_4')
              .with(
                command: '/bin/pkill -HUP rsyslogd',
                refreshonly: true,
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('rsyslog.conf logging_host')
          }
        end
      end
    end
  end
end
