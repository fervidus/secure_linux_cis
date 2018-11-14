require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_1_2' do
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
            is_expected.to contain_file('/etc/crontab')
              .with(
                ensure: 'file',
                owner:  'root',
                group:  'root',
                mode:   '0600',
              )
          }
        else
          it {
            is_expected.not_to contain_file('/etc/crontab')
          }
        end
      end
    end
  end
end
