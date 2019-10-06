require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_4_5' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os}" do
        let(:facts) { os_facts }
        let(:params) { { 'enforced' => option } }

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('/etc/bashrc_tmout')
            is_expected.to contain_file_line('/etc/profile_tmout')
            is_expected.to contain_file_line('/etc/bashrc_export_tmout')
            is_expected.to contain_file_line('/etc/profile_export_tmout')
            is_expected.to contain_file_line('bashrc_readonly_tmout')
          }
        else
          it {
            is_expected.not_to contain_file_line('/etc/bashrc_tmout')
            is_expected.not_to contain_file_line('/etc/profile_tmout')
            is_expected.not_to contain_file_line('/etc/bashrc_export_tmout')
            is_expected.not_to contain_file_line('/etc/profile_export_tmout')
            is_expected.not_to contain_file_line('bashrc_readonly_tmout')
          }
        end
      end
    end
  end
end