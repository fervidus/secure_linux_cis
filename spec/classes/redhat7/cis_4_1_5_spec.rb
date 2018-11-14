require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_5' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules user/group 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/group -p wa -k identity',
              )
            is_expected.to contain_file_line('audit.rules user/group 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/passwd -p wa -k identity',
              )
            is_expected.to contain_file_line('audit.rules user/group 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/gshadow -p wa -k identity',
              )
            is_expected.to contain_file_line('audit.rules user/group 4')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/shadow -p wa -k identity',
              )
            is_expected.to contain_file_line('audit.rules user/group 5')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/security/opasswd -p wa -k identity',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules user/group 1')
            is_expected.not_to contain_file_line('audit.rules user/group 2')
            is_expected.not_to contain_file_line('audit.rules user/group 3')
            is_expected.not_to contain_file_line('audit.rules user/group 4')
            is_expected.not_to contain_file_line('audit.rules user/group 5')
          }
        end
      end
    end
  end
end
