require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_1_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} rsyslog" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'rsyslog' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file('/etc/rsyslog.d/')
              .with(
                ensure: 'directory',
                recurse: true,
                mode: '0640',
              )
            is_expected.to contain_file_line('rsyslog.conf log_permissions').with(
              ensure: 'present',
              path:   '/etc/rsyslog.conf',
              line:   '$FileCreateMode 0640',
              match:  '^\$FileCreateMode.*',
              notify: 'Exec[reload rsyslog]',
            )
            is_expected.to contain_class('secure_linux_cis::service')
          }
        else
          it {
            is_expected.not_to contain_file('/etc/rsyslog.d/')
            is_expected.not_to contain_file_line('rsyslog.conf log_permissions')
            is_expected.not_to contain_class('secure_linux_cis::service')
          }
        end
      end
      context "on #{os} syslog-ng" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'syslog-ng' } }

        it { is_expected.to compile }

        it {
          is_expected.not_to contain_file('/etc/rsyslog.d/')
        }
      end
    end
  end
end
