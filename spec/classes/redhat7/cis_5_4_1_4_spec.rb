require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_4_1_4' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'pass_inactive_days' => 30 } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('useradd_inactive')
              .with(
                ensure: 'present',
                path: '/etc/default/useradd',
                line: 'INACTIVE=30',
                match: '^#?INACTIVE=',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('useradd_inactive')
          }
        end

      end
    end
  end
end
