require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_4_1_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'pass_max_days' => 180 } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('password expiration policy')
              .with(
                ensure: 'present',
                path: '/etc/login.defs',
                line: 'PASS_MAX_DAYS 180',
                match: '^#?PASS_MAX_DAYS',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('password expiration policy')
          }
        end
      end
    end
  end
end
