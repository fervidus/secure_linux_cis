require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_2_4' do
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
            is_expected.to contain_file_line('ssh x11')
              .with(
                ensure: 'present',
                path: '/etc/ssh/sshd_config',
                line: 'X11Forwarding no',
                match: '^#?[\r\n\f\v ]?X11Forwarding',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('ssh x11')
          }
        end
      end
    end
  end
end
