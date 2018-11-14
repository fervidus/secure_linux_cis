require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_1_5' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'is_logging_host' => false } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('rsyslog.conf ModLoad')
            is_expected.to contain_file_line('rsyslog.conf InputTCPServerRun')
            is_expected.to contain_exec('reload rsyslog 4_2_1_5')
              .with(
                command: '/bin/pkill -HUP rsyslogd',
                refreshonly: true,
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('rsyslog.conf ModLoad')
            is_expected.not_to contain_file_line('rsyslog.conf InputTCPServerRun')
            is_expected.not_to contain_exec('reload rsyslog 4_2_1_5')
          }
        end
      end
    end
  end
end
