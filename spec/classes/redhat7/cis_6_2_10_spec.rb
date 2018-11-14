require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_6_2_10' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} with option set to #{option}" do
        let(:facts) { os_facts.merge('dot_file_writable' => 'true') }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_notify('dfw')
          }
        else
          it { is_expected.not_to contain_notify('dfw') }
        end
      end
    end
  end
end
