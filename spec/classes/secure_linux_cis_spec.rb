require 'spec_helper'

describe 'secure_linux_cis' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      # Architecutre fact not included
      os_facts[:os]['architecture'] = 'x64'

      os_facts[:networking] = {}
      os_facts[:networking]['interfaces'] = {}
      os_facts[:networking]['network'] = '192.168.1.0'
      os_facts[:networking]['netmask'] = '255.255.255.0'

      let(:facts) { os_facts }

      let(:params) do
        {
          'time_servers' => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
        }
      end

      # pp os_facts[:os]['name'] + ' ' + os_facts[:os]['release']['major'] + ' ' + os_facts[:os]['architecture'] + ' ' + os_facts[:os]['family']
      # pp os_facts

      it { is_expected.to compile }

      # Do not believe hiera can interprolate properly
      it {
        is_expected.to contain_file('/etc/hosts.allow').with(
          'content' => 'sshd: ALL\nALL: 127.0.1.0/255.255.255.0',
        )
      }

      it {
        is_expected.to contain_file('/etc/hosts.deny').with(
          'content' => 'ALL: ALL',
        )
      }
    end

    context "on #{os} no time servers" do
      # Architecture fact not included
      os_facts[:os]['architecture'] = 'x64'

      let(:facts) { os_facts }

      it { is_expected.not_to compile }
    end
  end
end
