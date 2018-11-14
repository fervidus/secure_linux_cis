require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_1_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('max_log_file_action')
              .with(
                ensure: 'present',
                path: '/etc/audit/auditd.conf',
                line: 'max_log_file_action = keep_logs',
                match: '^max_log_file_action',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('max_log_file_action')
          }
        end
      end
    end
  end
end
