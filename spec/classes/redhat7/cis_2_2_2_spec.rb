require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_2_2_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          context 'With non compliant settings' do
            let(:facts) do
              super().merge('xorg_x11_packages' => ['xorg-x11-apps-7.7-7.el7.x86_64', 'xorg-x11-xkb-extras-7.7-12.el7.x86_64'])
            end

            it {
              is_expected.to contain_package('xorg-x11-apps-7.7-7.el7.x86_64')
                .with(
                  ensure: 'purged',
                )
              is_expected.to contain_package('xorg-x11-xkb-extras-7.7-12.el7.x86_64')
                .with(
                  ensure: 'purged',
                )
            }
          end
          context 'With compliant settings' do
            it {
              is_expected.not_to contain_package('xorg-x11-apps-7.7-7.el7.x86_64')
              is_expected.not_to contain_package('xorg-x11-xkb-extras-7.7-12.el7.x86_64')
            }
          end
        else
          context 'With this check disabled' do
            it {
              is_expected.not_to contain_package('xorg-x11-apps-7.7-7.el7.x86_64')
              is_expected.not_to contain_package('xorg-x11-xkb-extras-7.7-12.el7.x86_64')
            }
          end
        end
      end
    end
  end
end
