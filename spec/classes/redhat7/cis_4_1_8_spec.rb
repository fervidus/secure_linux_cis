require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_8' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules login/logout 1')
              .with(
                ensure: 'present',
                path: '/etc/audit/rules.d/audit.rules',
                line: '-w /var/log/lastlog -p wa -k logins',
              )
            case facts[:osfamily]
            when 'RedHat'
              is_expected.to contain_file_line('audit.rules login/logout 2')
                .with(
                  ensure: 'present',
                  path: '/etc/audit/rules.d/audit.rules',
                  line: '-w /var/run/faillock/ -p wa -k logins',
                )
            when 'Debian'
              is_expected.to contain_file_line('audit.rules login/logout 2')
                .with(
                  ensure: 'present',
                  path: '/etc/audit/rules.d/audit.rules',
                  line: '-w /var/run/faillog -p wa -k logins',
                )
              is_expected.to contain_file_line('audit.rules login/logout 3')
                .with(
                  ensure: 'present',
                  path: '/etc/audit/rules.d/audit.rules',
                  line: '-w /var/run/tallylog -p wa -k logins',
                )
            end
          }
        else
          it {
            is_expected.not_to contain_file_line('audit.rules login/logout 1')
            is_expected.not_to contain_file_line('audit.rules login/logout 2')
            is_expected.not_to contain_file_line('audit.rules login/logout 3')
          }
        end
      end
    end
  end
end
