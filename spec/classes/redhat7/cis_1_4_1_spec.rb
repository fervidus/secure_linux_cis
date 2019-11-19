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
            case facts[:osfamily]
            when 'RedHat'
              is_expected.to contain_file('/boot/grub2/grub.cfg')
              is_expected.to contain_file('/boot/grub2/user.cfg')
            when 'Debian'
              is_expected.to contain_file('/boot/grub/grub.cfg')
            end
          }
        else
          it {
            is_expected.not_to contain_file('/boot/grub2/grub.cfg')
            is_expected.not_to contain_file('/boot/grub2/user.cfg')
            is_expected.not_to contain_file('/boot/grub/grub.cfg')
          }
        end
      end
    end
  end
end
