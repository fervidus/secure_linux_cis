require 'spec_helper'

describe 'secure_linux_cis::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_exec('reload sshd') }
    end
  end
end
