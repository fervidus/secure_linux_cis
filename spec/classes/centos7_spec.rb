require 'spec_helper'

describe 'secure_linux_cis::centos7' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'        => 'CentOS',
        'operatingsystemrelease' => ['7'],
      },
    ],
  }
  on_supported_os(test_on).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts[:os][:architecture] = 'amd64'
        os_facts
      end

      it { is_expected.to compile }
      it {
        is_expected.to contain_file('/usr/share/cis_scripts').with(
          ensure: 'directory',
          owner:  'root',
          group:  'root',
          mode:   '0700',
        )
      }
    end
  end
end
