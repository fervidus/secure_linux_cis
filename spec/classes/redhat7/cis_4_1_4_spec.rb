require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_4' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} 64 bit architecture" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules time 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change',
              )
            is_expected.to contain_file_line('audit.rules time 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k timechange',
              )
            is_expected.to contain_file_line('audit.rules time 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b64 -S clock_settime -k time-change',
              )
            is_expected.to contain_file_line('audit.rules time 4')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S clock_settime -k time-change',
              )
            is_expected.to contain_file_line('audit.rules time 5')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/localtime -p wa -k time-change',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules time 1')
            is_expected.not_to contain_file_line('audit.rules time 2')
            is_expected.not_to contain_file_line('audit.rules time 3')
            is_expected.not_to contain_file_line('audit.rules time 4')
            is_expected.not_to contain_file_line('audit.rules time 5')
          }
        end
      end
      context "on #{os} 32 bit architecture" do
        let(:facts) { { 'architecture' => 'i386' } }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules time 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k timechange',
              )
            is_expected.to contain_file_line('audit.rules time 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-a always,exit -F arch=b32 -S clock_settime -k time-change',
              )
            is_expected.to contain_file_line('audit.rules time 3')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/localtime -p wa -k time-change',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules time 1')
            is_expected.not_to contain_file_line('audit.rules time 2')
            is_expected.not_to contain_file_line('audit.rules time 3')
          }
        end
      end
    end
  end
end
