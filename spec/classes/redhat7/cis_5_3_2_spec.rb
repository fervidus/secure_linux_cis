require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_3_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'lockout_time' => 900, 'attempts' => 5 } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_pam('pam_unix system-auth')
              .with(
                ensure: 'present',
                service: 'system-auth',
                type: 'auth',
                module:  'pam_unix.so',
                control: '[success=1 default=bad]',
                control_is_param: true,
                arguments: [],
              )
            is_expected.to contain_pam('pam_faillock preauth system-auth')
              .with(
                ensure: 'present',
                service: 'system-auth',
                type: 'auth',
                module: 'pam_faillock.so',
                control: 'required',
                control_is_param: true,
                arguments: [
                  'preauth',
                  'audit',
                  'silent',
                  'deny=5',
                  'unlock_time=900',
                ],
                position: 'before *[type="auth" and module="pam_unix.so"]',
              )
            is_expected.to contain_pam('pam_faillock authfail system-auth')
              .with(
                ensure: 'present',
                service: 'system-auth',
                type: 'auth',
                module: 'pam_faillock.so',
                control: '[default=die]',
                control_is_param: true,
                arguments: [
                  'authfail',
                  'audit',
                  'deny=5',
                  'unlock_time=900',
                ],
                position: 'after *[type="auth" and module="pam_unix.so"]',
              )
            is_expected.to contain_pam('pam_faillock authsucc system-auth')
              .with(
                ensure: 'present',
                service: 'system-auth',
                type: 'auth',
                module: 'pam_faillock.so',
                control: 'sufficient',
                control_is_param: true,
                arguments: [
                  'authsucc',
                  'audit',
                  'deny=5',
                  'unlock_time=900',
                ],
                position: 'after *[type="auth" and module="pam_faillock.so" and control="[default=die]"]',
              )
            is_expected.to contain_pam('pam_unix password-auth')
              .with(
                ensure: 'present',
                service: 'password-auth',
                type: 'auth',
                module:  'pam_unix.so',
                control: '[success=1 default=bad]',
                control_is_param: true,
                arguments: [],
              )
            is_expected.to contain_pam('pam_faillock preauth password-auth')
              .with(
                ensure: 'present',
                service: 'password-auth',
                type: 'auth',
                module: 'pam_faillock.so',
                control: 'required',
                control_is_param: true,
                arguments: [
                  'preauth',
                  'audit',
                  'silent',
                  'deny=5',
                  'unlock_time=900',
                ],
                position: 'before *[type="auth" and module="pam_unix.so"]',
              )
            is_expected.to contain_pam('pam_faillock authfail password-auth')
              .with(
                ensure: 'present',
                service: 'password-auth',
                type: 'auth',
                module: 'pam_faillock.so',
                control: '[default=die]',
                control_is_param: true,
                arguments: [
                  'authfail',
                  'audit',
                  'deny=5',
                  'unlock_time=900',
                ],
                position: 'after *[type="auth" and module="pam_unix.so"]',
              )
            is_expected.to contain_pam('pam_faillock authsucc password-auth')
              .with(
                ensure: 'present',
                service: 'password-auth',
                type: 'auth',
                module: 'pam_faillock.so',
                control: 'sufficient',
                control_is_param: true,
                arguments: [
                  'authsucc',
                  'audit',
                  'deny=5',
                  'unlock_time=900',
                ],
                position: 'after *[type="auth" and module="pam_faillock.so" and control="[default=die]"]',
              )
          }
        else
          it {
            is_expected.not_to contain_pam('5.3.2 pam_unix system-auth')
            is_expected.not_to contain_pam('pam_faillock preauth system-auth')
            is_expected.not_to contain_pam('pam_faillock authfail system-auth')
            is_expected.not_to contain_pam('pam_faillock authsucc system-auth')
            is_expected.not_to contain_pam('5.3.2 pam_unix password-auth')
            is_expected.not_to contain_pam('pam_faillock preauth password-auth')
            is_expected.not_to contain_pam('pam_faillock authfail password-auth')
            is_expected.not_to contain_pam('pam_faillock authsucc password-auth')
          }
        end
      end
    end
  end
end
