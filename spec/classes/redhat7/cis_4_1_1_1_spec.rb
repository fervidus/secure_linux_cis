require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_1_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'max_log_file' => 8 } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('max_log_file')
              .with(
                ensure: 'present',
                path: '/etc/audit/auditd.conf',
                line: 'max_log_file = 8',
                match: '^max_log_file',
              )
          }
        else
          it { is_expected.not_to contain_file_line('max_log_file') }
        end
      end
    end
  end
end
