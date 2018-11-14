require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_2_2_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} syslog-ng" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'syslog-ng' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_service('syslog-ng')
              .with(
                ensure: 'running',
                enable: true,
              )
          }
        else
          it {
            is_expected.not_to contain_service('syslog-ng')
          }
        end
      end
      context "on #{os} rsyslog" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'logging' => 'rsyslog' } }

        it { is_expected.to compile }

        it {
          is_expected.not_to contain_service('rsyslog')
        }
      end
    end
  end
end
