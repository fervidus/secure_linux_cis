require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_2_2_11' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            case facts[:osfamily]
            when 'RedHat'
              is_expected.to contain_service('dovecot')
                .with(
                  ensure: 'stopped',
                  enable: false,
                )
              is_expected.to contain_service('cyrus-imap')
                .with(
                  ensure: 'stopped',
                  enable: false,
                )
            when 'Debian'
              is_expected.to contain_package('exim4')
                .with(
                  ensure: 'absent',
                )
            end
          }
        else
          it {
            is_expected.not_to contain_service('dovecot')
            is_expected.not_to contain_service('cyrus-imap')
            is_expected.not_to contain_package('exim4')
          }
        end
      end
    end
  end
end
