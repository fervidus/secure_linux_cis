require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_1_8' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it {
          is_expected.to compile
        }

        if option
          it {
            is_expected.to contain_file('/etc/cron.allow')
              .with(
                ensure: 'file',
                owner: 'root',
                group: 'root',
                mode: '0600',
              )
            is_expected.to contain_file('/etc/at.allow')
              .with(
                ensure: 'file',
                owner: 'root',
                group: 'root',
                mode: '0600',
              )
          }
          it {
            is_expected.not_to contain_file('etc/cron.deny')
            is_expected.not_to contain_file('etc/at.deny')
          }
        else
          it {
            is_expected.not_to contain_file('/etc/at.allow')
            is_expected.not_to contain_file('/etc/cron.allow')
          }
        end
      end
    end
  end
end
