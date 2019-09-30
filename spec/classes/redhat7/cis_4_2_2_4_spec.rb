require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_2_4' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} syslog-ng" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'syslog-ng', 'logging_host' => 'loghost.example.com' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('syslog-ng.conf logging_host')
              .with(
                path: '/etc/syslog-ng/syslog-ng.conf',
                line: 'destination logserver { tcp("loghost.example.com" port(514)); }; log { source(src); destination(logserver); };',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('syslog-ng.conf logging_host')
          }
        end
      end
      context "on #{os} rsyslog" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'rsyslog' } }

        it { is_expected.to compile }

        it {
          is_expected.not_to contain_file_line('syslog-ng.conf logging_host')
        }
      end
    end
  end
end
