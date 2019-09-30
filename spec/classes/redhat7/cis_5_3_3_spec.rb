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
            is_expected.to contain_pam('pam system-auth sufficient')
              .with(
                ensure:  'present',
                service: 'system-auth',
                type:    'password',
                control: 'sufficient',
                module:  'pam_unix.so',
                arguments: ['remember=5', 'sha512', 'shadow', 'try_first_pass', 'use_authtok'],
              )
            is_expected.to contain_pam('pam password-auth sufficient')
              .with(
                ensure:  'present',
                service: 'password-auth',
                type:    'password',
                control: 'sufficient',
                module:  'pam_unix.so',
                arguments: ['remember=5', 'sha512', 'shadow', 'try_first_pass', 'use_authtok'],
              )
          }
        else
          it {
            is_expected.not_to contain_pam('pam system-auth sufficient')
            is_expected.not_to contain_pam('pam password-auth sufficient')
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
