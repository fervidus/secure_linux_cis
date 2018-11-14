require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_3_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'minlen' => 14, 'dcredit' => -1, 'ucredit' => -1, 'ocredit' => -1, 'lcredit' => -1 } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('pam password auth')
              .with(
                ensure: 'present',
                path: '/etc/pam.d/password-auth',
                line: 'password requisite pam_pwquality.so try_first_pass retry=3',
                match: 'pam_pwquality.so',
              )
            is_expected.to contain_file_line('pam system auth')
              .with(
                ensure: 'present',
                path: '/etc/pam.d/system-auth',
                line: 'password requisite pam_pwquality.so try_first_pass retry=3',
                match: 'pam_pwquality.so',
              )
            is_expected.to contain_file_line('pam minlen')
              .with(
                ensure: 'present',
                path: '/etc/security/pwquality.conf',
                line: 'minlen = 14',
                match: '^#?minlen',
              )
            is_expected.to contain_file_line('pam dcredit')
              .with(
                ensure: 'present',
                path: '/etc/security/pwquality.conf',
                line: 'dcredit = -1',
                match: '^#?dcredit',
              )
            is_expected.to contain_file_line('pam ucredit')
              .with(
                ensure: 'present',
                path: '/etc/security/pwquality.conf',
                line: 'ucredit = -1',
                match: '^#?ucredit',
              )
            is_expected.to contain_file_line('pam ocredit')
              .with(
                ensure: 'present',
                path: '/etc/security/pwquality.conf',
                line: 'ocredit = -1',
                match: '^#?ocredit',
              )
            is_expected.to contain_file_line('pam lcredit')
              .with(
                ensure: 'present',
                path: '/etc/security/pwquality.conf',
                line: 'lcredit = -1',
                match: '^#?lcredit',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('pam password auth')
            is_expected.not_to contain_file_line('pam system auth')
            is_expected.not_to contain_file_line('pam minlen')
            is_expected.not_to contain_file_line('pam dcredit')
            is_expected.not_to contain_file_line('pam ucredit')
            is_expected.not_to contain_file_line('pam ocredit')
            is_expected.not_to contain_file_line('pam lcredit')
          }
        end
      end
    end
  end
end
