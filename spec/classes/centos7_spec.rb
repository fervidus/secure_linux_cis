require 'spec_helper'

describe 'secure_linux_cis::centos7' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) do
        os_facts.merge(
          'os' => {
            'architecture' => 'amd64',
            'name' => 'RedHat',
            'release' => { 'major' => 7 },
          },
        )
      end

      it { is_expected.to compile }
      it {
        is_expected.to contain_file('/tmp/cis_scripts').with(
          ensure: 'directory',
          owner:  'root',
          group:  'root',
          mode:   '0755',
        )
      }
    end
  end
end
