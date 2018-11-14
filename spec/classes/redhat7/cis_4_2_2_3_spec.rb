require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_2_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} syslog-ng" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'syslog-ng' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('syslog-ng.conf permissions')
              .with(
                path: '/etc/syslog-ng/syslog-ng.conf',
                line: 'options { chain_hostnames(off); flush_lines(0); perm(0640); stats_freq(3600); threaded(yes); };',
              )
            is_expected.to contain_exec('reload syslog-ng 4_2_2_3')
              .with(
                command: '/bin/pkill -HUP syslog-ng',
                refreshonly: true,
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('syslog-ng.conf permissions')
            is_expected.not_to contain_exec('reload syslog-ng 4_2_2_3')
          }
        end
      end
      context "on #{os} rsyslog" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'rsyslog' } }

        it { is_expected.to compile }

        it {
          is_expected.not_to contain_file_line('syslog-ng.conf permissions')
          is_expected.not_to contain_exec('reload syslog-ng 4_2_2_3')
        }
      end
    end
  end
end
