require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_4_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file('/boot/grub2/grub.cfg')
            is_expected.to contain_file('/boot/grub2/user.cfg')
          }
        else
          it {
            is_expected.not_to contain_exec('/boot/grub2/grub.cfg')
            is_expected.not_to contain_exec('/boot/grub2/user.cfg')
          }
        end
      end
    end
  end
end
