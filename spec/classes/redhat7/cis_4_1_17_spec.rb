require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_17' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} 64 bit architecture" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules kernel module 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /sbin/insmod -p x -k modules',
              )
            is_expected.to contain_file_line('audit.rules kernel module 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /sbin/rmmod -p x -k modules',
              )
            is_expected.to contain_file_line('audit.rules kernel module 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /sbin/modprobe -p x -k modules',
              )
            is_expected.to contain_file_line('audit.rules kernel module 4')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules kernel module 1')
            is_expected.not_to contain_file_line('audit.rules kernel module 2')
            is_expected.not_to contain_file_line('audit.rules kernel module 3')
            is_expected.not_to contain_file_line('audit.rules kernel module 4')
          }
        end
      end
      context "on #{os} 32 bit architecture" do
        let(:facts) { { 'architecture' => 'i386' } }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules kernel module 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /sbin/insmod -p x -k modules',
              )
            is_expected.to contain_file_line('audit.rules kernel module 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /sbin/rmmod -p x -k modules',
              )
            is_expected.to contain_file_line('audit.rules kernel module 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /sbin/modprobe -p x -k modules',
              )
            is_expected.to contain_file_line('audit.rules kernel module 4')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S init_module -S delete_module -k modules',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules kernel module 1')
            is_expected.not_to contain_file_line('audit.rules kernel module 2')
            is_expected.not_to contain_file_line('audit.rules kernel module 3')
            is_expected.not_to contain_file_line('audit.rules kernel module 4')
          }
        end
      end
    end
  end
end
