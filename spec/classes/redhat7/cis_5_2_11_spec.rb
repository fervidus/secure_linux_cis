require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_2_11' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} with default algorithms" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'approved_mac_algorithms' => ['hmac-sha2-512-etm@openssh.com',
                                                                'hmac-sha2-256-etm@openssh.com', 'umac-128-etm@openssh.com', 'hmac-sha2-512', 'hmac-sha2-256', 'umac-128@openssh.com'] }
        end

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('ssh mac algorithms')
              .with(
                ensure: 'present',
                path:   '/etc/ssh/sshd_config',
                line:   'MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com',
                match:  '^#?MACs',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('ssh mac algorithm')
          }
        end
      end

      context "on #{os} with invalid algorithms" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'approved_mac_algorithms' => ['invalid@ssh.com'] }
        end

        if option
          it { is_expected.not_to compile }
        else
          it { is_expected.to compile }
        end
      end
    end
  end
end
