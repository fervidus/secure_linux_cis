require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_7_1_5' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option, 'banner' => 'issue text' } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file('/etc/issue').with(
              ensure:  'present',
              owner:   'root',
              group:   'root',
              mode:    '0644',
              content: 'issue text',
            )
          }
        else
          it { is_expected.not_to contain_file('/etc/issue') }
        end
      end
    end
  end
end
