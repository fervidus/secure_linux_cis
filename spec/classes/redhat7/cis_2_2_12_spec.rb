require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_2_2_12' do
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
              is_expected.to contain_service('smb')
                .with(
                  ensure: 'stopped',
                  enable: false,
                )
            when 'Debian'
              is_expected.to contain_service('smbd')
                .with(
                  ensure: 'stopped',
                  enable: false,
                )
            end
          }
        else
          it {
            is_expected.not_to contain_service('smb')
            is_expected.not_to contain_service('smbd')
          }
        end
      end
    end
  end
end
