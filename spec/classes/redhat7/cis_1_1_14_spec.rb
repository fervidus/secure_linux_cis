require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_1_14' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) do
          os_facts.merge(
            'mountpoints' => {
              '/home' => {
                'device' => '/dev/home',
                'filesystem' => '/home',
                'options' => [
                  'rw',
                ],
              },
            },
          )
        end
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_secure_linux_cis__mount_options('/home-nodev')
          }
        else
          it { is_expected.not_to contain_secure_linux_cis__mount_options('/home-nodev') }
        end
      end
    end
  end
end
