require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_2_2_8' do
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
              service = 'named'
            when 'Debian'
              service = 'bind9'
            end
            is_expected.to contain_service(service)
              .with(
                ensure: 'stopped',
                enable: false,
              )
          }
        else
          it {
            is_expected.not_to contain_service('named')
            is_expected.not_to contain_service('bind9')
          }
        end
      end
    end
  end
end
