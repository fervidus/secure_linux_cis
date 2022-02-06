require 'spec_helper'

describe 'secure_linux_cis' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'           => 'Ubuntu',
        'operatingsystemrelease'    => '18.04',
      },
    ],
  }

  on_supported_os(test_on).each do |_os, os_facts|
    let(:facts) { os_facts }
    let(:params) do
      {
        'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
        'profile_type'      => 'workstation',
        'enforcement_level' => '2',
      }
    end

    it { is_expected.to compile.with_all_deps }
  end
end
