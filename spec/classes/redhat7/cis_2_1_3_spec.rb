require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_2_1_3' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_service('discard-dgram')
              .with(
                ensure: 'stopped',
                enable: false,
              )
            is_expected.to contain_service('discard-stream')
              .with(
                ensure: 'stopped',
                enable: false,
              )
          }
        else
          it {
            is_expected.not_to contain_service('discard-dgram')
            is_expected.not_to contain_service('discard-stream')
          }
        end
      end
    end
  end
end
