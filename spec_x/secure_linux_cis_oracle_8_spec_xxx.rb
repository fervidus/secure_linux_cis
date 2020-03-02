require 'spec_helper'

describe 'secure_linux_cis' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'        => 'OracleLinux',
        'operatingsystemrelease' => ['8'],
      },
    ],
  }

  on_supported_os(test_on).each do |os, os_facts|
    puts "\n##########>  #{os}  <##########\n\n"

    let(:facts) { os_facts }

    let(:params) do
      {
        'time_servers' => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
        'profile_type' => 'server',
      }
    end

    it { is_expected.to compile.with_all_deps }
  end
end
