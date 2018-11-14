require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_7_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            # is_expected.to contain_file('gdm').that_requires('File[banner-login]').that_notifies('Exec[dconf]')
            is_expected.to contain_file('banner-login').that_requires('File[gdm]')
            is_expected.to contain_file('banner-login').that_notifies('Exec[dconf]')
          }
        else
          it {
            is_expected.not_to contain_file('gdm')
            is_expected.not_to contain_file('banner-login')
            is_expected.not_to contain_exec('dconf')
          }
        end
      end
    end
  end
end
