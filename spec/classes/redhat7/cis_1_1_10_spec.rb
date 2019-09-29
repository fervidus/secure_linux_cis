require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_1_10' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) do
          os_facts.merge(
            'mountpoints' => {
              '/var/tmp' => {
                'device' => 'tmpfs',
                'filesystem' => 'tmpfs',
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
            is_expected.to contain_secure_linux_cis__mount_options('/var/tmp-noexec')
          }
        else
          it { is_expected.not_to contain_secure_linux_cis__mount_options('/var/tmp-noexec') }
        end
      end
    end
  end
end
