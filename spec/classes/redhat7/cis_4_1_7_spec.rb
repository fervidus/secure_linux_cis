require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_7' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules selinux 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /etc/selinux/ -p wa -k MAC-policy',
              )
            is_expected.to contain_file_line('audit.rules selinux 2')
              .with(
                ensure: 'present',
                path: '/etc/audit/audit.rules',
                line: '-w /usr/share/selinux/ -p wa -k MAC-policy',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules selinux 1')
            is_expected.not_to contain_file_line('audit.rules selinux 2')
          }
        end
      end
    end
  end
end
