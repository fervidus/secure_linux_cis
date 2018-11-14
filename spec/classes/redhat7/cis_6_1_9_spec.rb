require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_6_1_9' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file('/etc/gshadow-')
              .with(
                ensure: 'present',
                owner: 'root',
                group: 'root',
                mode: '0000',
              )
          }
        else
          it { is_expected.not_to contain_file('/etc/gshadow-') }
        end
      end
    end
  end
end
