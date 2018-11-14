require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_15' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules sudoers 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/sudoers -p wa -k scope',
              )
            is_expected.to contain_file_line('audit.rules sudoers 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/sudoers.d/ -p wa -k scope',
              )
          }
        else
          it { is_expected.not_to contain_file_line('audit.rules sudoers 1') }
          it { is_expected.not_to contain_file_line('audit.rules sudoers 2') }
        end
      end
    end
  end
end
