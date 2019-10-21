require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_4_1_12' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          context 'With this check enabled' do
            let(:facts) do
              super().merge('audit_privileged' => '-a always,exit -F path=/usr/bin/sudo -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged')
            end

            it {
              is_expected.to contain_file('/etc/audit/rules.d/cis_4_1_12.rules').with_content('-a always,exit -F path=/usr/bin/sudo -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged')
              is_expected.to contain_file('/usr/share/cis_scripts/audit_priv.sh').with(ensure: 'file')
            }
          end
        else
          context 'With this check disabled' do
            it { is_expected.not_to contain_file('/etc/audit/rules.d/cis_4_1_12.rules') }
          end
        end
      end
    end
  end
end
