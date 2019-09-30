require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_1_7_2' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          context 'With non compliant settings' do
            let(:facts) do
              super().merge('gnome_installed' => true)
            end

            it {
              is_expected.to contain_file('/etc/dconf/profile/gdm')
              is_expected.to contain_file('/etc/dconf/db/gdm.d/01-banner-message').that_requires('File[/etc/dconf/profile/gdm]')
              is_expected.to contain_file('/etc/dconf/db/gdm.d/01-banner-message').that_notifies('Exec[dconf]')
              is_expected.to contain_exec('dconf')
            }
          end
          context 'With compliant settings' do
            it {
              is_expected.not_to contain_file('/etc/dconf/profile/gdm')
              is_expected.not_to contain_file('/etc/dconf/db/gdm.d/01-banner-message')
              is_expected.not_to contain_exec('dconf')
            }
          end
        else
          context 'With this check disabled' do
            it {
              is_expected.not_to contain_file('/etc/dconf/profile/gdm')
              is_expected.not_to contain_file('/etc/dconf/db/gdm.d/01-banner-message')
              is_expected.not_to contain_exec('dconf')
            }
          end
        end
      end
    end
  end
end
