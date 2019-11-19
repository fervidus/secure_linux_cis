require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_4_1_4' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'pass_inactive_days' => 30 } }

        it { is_expected.to compile }

        if option
<<<<<<< HEAD
          it {
            is_expected.to contain_file_line('useradd_inactive')
              .with(
                ensure: 'present',
                path: '/etc/default/useradd',
                line: 'INACTIVE=30',
                match: '^#?INACTIVE=',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('useradd_inactive')
          }
        end

=======
          it { is_expected.to contain_file_line('useradd_inactive') }
          context 'With non compliant settings' do
            let(:facts) do
              super().merge(
                'local_users' => {
                  'root' => {
                    'password_expires_days' => 60,
                    'password_inactive_days' => 99,
                  },
                },
              )
            end

            it {
              is_expected.to contain_exec('/usr/bin/chage --inactive 30 root')
            }
          end
          context 'With compliant settings' do
            let(:facts) do
              super().merge(
                'local_users' => {
                  'root' => { 'password_expires_days' => 'never' },
                },
              )
            end

            it {
              is_expected.not_to contain_exec('/usr/bin/chage --inactive 30 root')
            }
          end
        else
          context 'With this check disabled' do
            it { is_expected.not_to contain_shellvar('cis_5_4_1_4') }
            it { is_expected.not_to contain_exec('/usr/bin/chage --inactive 30 root') }
          end
        end
>>>>>>> c4ffb07011687d608c4aaeb3018d62fdaa6f7383
      end
    end
  end
end
