require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_1_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('space_left_action')
              .with(
                ensure: 'present',
                path: '/etc/audit/auditd.conf',
                line: 'space_left_action = email',
                match: '^space_left_action',
              )
            is_expected.to contain_file_line('action_mail_acct')
              .with(
                ensure: 'present',
                path: '/etc/audit/auditd.conf',
                line: 'action_mail_acct = root',
                match: '^action_mail_acct',
              )
            is_expected.to contain_file_line('admin_space_left_action')
              .with(
                ensure: 'present',
                path: '/etc/audit/auditd.conf',
                line: 'admin_space_left_action = halt',
                match: '^admin_space_left_action',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('space_left_action')
            is_expected.not_to contain_file_line('action_mail_acct')
            is_expected.not_to contain_file_line('admin_space_left_action')
          }
        end
      end
    end
  end
end
