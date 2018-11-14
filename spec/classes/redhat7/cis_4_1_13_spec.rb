require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_13' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} 64 bit architecture" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules mounts 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
              )
            is_expected.to contain_file_line('audit.rules mounts 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules mounts 1')
            is_expected.not_to contain_file_line('audit.rules mounts 2')
          }
        end
      end
      context "on #{os} 32 bit architecture" do
        let(:facts) { { 'architecture' => 'i386' } }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules mounts 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules mounts 1')
          }
        end
      end
    end
  end
end
