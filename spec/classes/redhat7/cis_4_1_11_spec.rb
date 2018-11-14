require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_11' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} 64 bit architecture" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules file access 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access',
              )
            is_expected.to contain_file_line('audit.rules file access 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access',
              )
            is_expected.to contain_file_line('audit.rules file access 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access',
              )
            is_expected.to contain_file_line('audit.rules file access 4')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules file access 1')
            is_expected.not_to contain_file_line('audit.rules file access 2')
            is_expected.not_to contain_file_line('audit.rules file access 3')
            is_expected.not_to contain_file_line('audit.rules file access 4')
          }
        end
      end
      context "on #{os} 32 bit architecture" do
        let(:facts) { { 'architecture' => 'i386' } }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules file access 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access',
              )
            is_expected.to contain_file_line('audit.rules file access 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules file access 1')
            is_expected.not_to contain_file_line('audit.rules file access 2')
          }
        end
      end
    end
  end
end
