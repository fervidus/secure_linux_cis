require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_2_1' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) do
          os_facts.merge(
            'yum_repolist' => ['rhel-7-server-rpms/7Server/x86_64'],
          )
        end

        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          context 'With non compliant settings' do
            let(:facts) do
              super().merge(
                'yum_repolist' => ['oracle-7-server-rpms/7Server/x86_64'],
              )
            end

            it {
              is_expected.to contain_notify('No approved repo found in list:  [rhel-7-server-rpms/7Server/x86_64]')
            }
          end
          context 'With compliant settings' do
            it {
              is_expected.not_to contain_notify('No approved repo found in list:  [rhel-7-server-rpms/7Server/x86_64]')
            }
          end
        else
          context 'With this check disabled' do
            it { is_expected.not_to contain_notify('No approved repo found in list:  [rhel-7-server-rpms/7Server/x86_64]') }
          end
        end
      end
    end
  end
end
