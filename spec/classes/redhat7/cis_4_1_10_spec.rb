require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_10' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} 64 bit architecture" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules access 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
            is_expected.to contain_file_line('audit.rules access 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
            is_expected.to contain_file_line('audit.rules access 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
            is_expected.to contain_file_line('audit.rules access 4')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
            is_expected.to contain_file_line('audit.rules access 5')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
            is_expected.to contain_file_line('audit.rules access 6')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules access 1')
            is_expected.not_to contain_file_line('audit.rules access 2')
            is_expected.not_to contain_file_line('audit.rules access 3')
            is_expected.not_to contain_file_line('audit.rules access 4')
            is_expected.not_to contain_file_line('audit.rules access 5')
            is_expected.not_to contain_file_line('audit.rules access 6')
          }
        end
      end
      context "on #{os} 32 bit architecture" do
        let(:facts) { { 'architecture' => 'i386' } }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules access 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
            is_expected.to contain_file_line('audit.rules access 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
            is_expected.to contain_file_line('audit.rules access 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules access 1')
            is_expected.not_to contain_file_line('audit.rules access 2')
            is_expected.not_to contain_file_line('audit.rules access 3')
          }
        end
      end
    end
  end
end
