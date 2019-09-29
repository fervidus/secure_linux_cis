require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_18' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('audit.rules make immutable')
              .with(
                ensure: 'present',
                path: '/etc/audit/rules.d/audit.rules',
                line: '-e 2',
              )
          }
        else
          it { is_expected.not_to contain_file_line('audit.rules sudoers 1') }
        end
      end
    end
  end
end
