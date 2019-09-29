require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_6_2_4' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          context 'With non compliant settings' do
            let(:facts) do
              super().merge('plus_group' => '+:group')
            end

            it {
              is_expected.to contain_notify('pg')
            }
          end
          context 'With compliant settings' do
            it {
              is_expected.not_to contain_notify('pg')
            }
          end
        else
          context 'With this check disabled' do
            it { is_expected.not_to contain_notify('pg') }
          end
        end
      end
    end
  end
end
