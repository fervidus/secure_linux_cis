require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_6_2_19' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          context 'With non compliant settings' do
            let(:facts) do
              super().merge('duplicate_group' => 'Duplicate Group Name (2): gids')
            end

            it {
              is_expected.to contain_notify('dgrp')
            }
          end
          context 'With compliant settings' do
            it {
              is_expected.not_to contain_notify('dgrp')
            }
          end
          it { is_expected.to contain_file('/usr/share/cis_scripts/dup_group.sh').with(ensure: 'file') }
        else
          context 'With this check disabled' do
            it { is_expected.not_to contain_notify('dgrp') }
          end
        end
      end
    end
  end
end
