require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_1_15' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) do
          os_facts.merge(
            'mountpoints' => {
              '/dev/shm' => {
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
          it { is_expected.to contain_mount('/dev/shm') }
        else
          it { is_expected.not_to contain_mount('/dev/shm') }
        end
      end
    end
  end
end
