require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_2_5' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} syslog-ng" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'syslog-ng', 'is_logging_host' => true } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('syslog-ng.conf remote 1')
              .with(
                path: '/etc/syslog-ng/syslog-ng.conf',
                line: 'source net{ tcp(); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf remote 2')
              .with(
                path: '/etc/syslog-ng/syslog-ng.conf',
                line: 'destination remote { file("/var/log/remote/${FULLHOST}-log"); };',
              )
            is_expected.to contain_file_line('syslog-ng.conf remote 3')
              .with(
                path: '/etc/syslog-ng/syslog-ng.conf',
                line: 'log { source(net); destination(remote); };',
              )
            is_expected.to contain_exec('reload syslog-ng 4_2_2_5')
              .with(
                command: '/bin/pkill -HUP syslog-ng',
                refreshonly: true,
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('syslog-ng.conf remote 1')
            is_expected.not_to contain_file_line('syslog-ng.conf remote 2')
            is_expected.not_to contain_file_line('syslog-ng.conf remote 3')
            is_expected.not_to contain_exec('reload syslog-ng 4_2_2_5')
          }
        end
      end
      context "on #{os} rsyslog" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'rsyslog' } }

        it { is_expected.to compile }

        it {
          is_expected.not_to contain_file_line('syslog-ng.conf remote 1')
          is_expected.not_to contain_file_line('syslog-ng.conf remote 2')
          is_expected.not_to contain_file_line('syslog-ng.conf remote 3')
          is_expected.not_to contain_exec('reload syslog-ng 4_2_2_5')
        }
      end
    end
  end
end
