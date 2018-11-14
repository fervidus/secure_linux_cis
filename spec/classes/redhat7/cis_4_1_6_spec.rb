require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_6' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} 64 bit architecture" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules network 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/issue -p wa -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 4')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/issue.net -p wa -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 5')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/hosts -p wa -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 6')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/sysconfig/network -p wa -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 7')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/sysconfig/network-scripts/ -p wa -k system-locale',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules network 1')
            is_expected.not_to contain_file_line('audit.rules network 2')
            is_expected.not_to contain_file_line('audit.rules network 3')
            is_expected.not_to contain_file_line('audit.rules network 4')
            is_expected.not_to contain_file_line('audit.rules network 5')
            is_expected.not_to contain_file_line('audit.rules network 6')
            is_expected.not_to contain_file_line('audit.rules network 7')
          }
        end
      end
      context "on #{os} 32 bit architecture" do
        let(:facts) { { 'architecture' => 'i386' } }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules network 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/issue -p wa -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/issue.net -p wa -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 4')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/hosts -p wa -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 5')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/sysconfig/network -p wa -k system-locale',
              )
            is_expected.to contain_file_line('audit.rules network 6')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/sysconfig/network-scripts/ -p wa -k system-locale',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules network 1')
            is_expected.not_to contain_file_line('audit.rules network 2')
            is_expected.not_to contain_file_line('audit.rules network 3')
            is_expected.not_to contain_file_line('audit.rules network 4')
            is_expected.not_to contain_file_line('audit.rules network 5')
            is_expected.not_to contain_file_line('audit.rules network 6')
          }
        end
      end
    end
  end
end
