require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::centos7::cis_6_1_10' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          context 'With non compliant settings' do
            let(:facts) do
              super().merge('world_writable_redhat' => '/file')
            end

            it {
              is_expected.to contain_notify('wwrh')
            }
          end
          context 'With compliant settings' do
            it {
              is_expected.not_to contain_notify('wwrh')
            }
          end
        else
          context 'With this check disabled' do
            it { is_expected.not_to contain_notify('wwrh') }
          end
        end
      end
    end
  end
end
