require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_3_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'past_passwords' => 5 } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('password recycle system-auth')
              .with(
                ensure: 'present',
                path: '/etc/pam.d/system-auth',
                line: 'password sufficient pam_unix.so remember=5',
                match: '^#?password sufficient pam_unix\.so|^#?password required pam_pwhistory\.so',
              )
            is_expected.to contain_file_line('password recycle password-auth')
              .with(
                ensure: 'present',
                path: '/etc/pam.d/password-auth',
                line: 'password sufficient pam_unix.so remember=5',
                match: '^#?password sufficient pam_unix\.so|^#?password required pam_pwhistory\.so',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('password recycle password-auth')
            is_expected.not_to contain_file_line('password recycle system-auth')
          }
        end
      end
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'past_passwords' => 3 } }

        if option
          it { is_expected.not_to compile }
        else
          it { is_expected.to compile }
        end
      end
    end
  end
end
