require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_1_20' do
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
                'mountpoints' => {
                  '/cdrom' => { 'options' => ['rw'] },
                },
              )
            end

            it {
              is_expected.to contain_notify('1_1_20 noexec /cdrom')
            }
          end
          context 'With compliant settings' do
            let(:facts) do
              super().merge(
                'mountpoints' => {
                  '/cdrom' => { 'options' => ['noexec'] },
                },
              )
            end

            it {
              is_expected.not_to contain_notify('1_1_20 noexec /cdrom')
            }
          end
        else
          context 'With this check disabled' do
            it { is_expected.not_to contain_notify('1_1_20 noexec /cdrom') }
          end
        end
      end
    end
  end
end
