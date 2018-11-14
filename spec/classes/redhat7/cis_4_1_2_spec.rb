require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_package('audit')
              .with(
                ensure: 'installed',
              )
            is_expected.to contain_service('auditd')
              .with(
                ensure: 'running',
                enable: true,
              )
          }
        else
          it {
            is_expected.not_to contain_package('audit')
            is_expected.not_to contain_service('auditd')
          }
        end
      end
    end
  end
end
