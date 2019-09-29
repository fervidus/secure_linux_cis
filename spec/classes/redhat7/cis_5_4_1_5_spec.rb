require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_4_1_5' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          context 'With non compliant settings' do
            let(:facts) do
              super().merge(
                'local_users' => {
                  'root' => { 'password_date_valid' => false },
                },
              )
            end

            it {
              is_expected.to contain_notify('plcd root')
            }
          end
          context 'With compliant settings' do
            let(:facts) do
              super().merge(
                'local_users' => {
                  'root' => { 'password_date_valid' => true },
                },
              )
            end

            it {
              is_expected.not_to contain_notify('plcd root')
            }
          end
        else
          context 'With this check disabled' do
            it { is_expected.not_to contain_notify('plcd root') }
          end
        end
      end
    end
  end
end
