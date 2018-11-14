require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_2_14' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} with default parameters" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'allow_users' => [], 'allow_groups' => [], 'deny_users' => [], 'deny_groups' => [] } }

        if option
          it {
            is_expected.to contain_notify('allow_groups')
          }
        else
          it {
            is_expected.not_to contain_notify('allow_groups')
          }
        end
      end
      context "on #{os} with allow_user" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'allow_users' => ['user1', 'user2', 'user3'], 'allow_groups' => [], 'deny_users' => [], 'deny_groups' => [] } }

        it { is_expected.to compile }
        if option
          it {
            is_expected.to contain_file_line('ssh allow users')
              .with(
                ensure: 'present',
                path: '/etc/ssh/sshd_config',
                line: 'AllowUsers user1 user2 user3',
                match: '^#?AllowUsers',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('ssh allow users')
          }
        end
      end
    end
  end
end
