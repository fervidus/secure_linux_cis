require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::debian9::cis_5_2_15' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} with default key exchange algorithms" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'approved_kex' => [
            'curve25519-sha256',
            'curve25519-sha256@libssh.org',
            'diffie-hellman-group14-sha256',
            'diffie-hellman-group16-sha512',
            'diffie-hellman-group18-sha512',
            'ecdh-sha2-nistp521',
            'ecdh-sha2-nistp384',
            'ecdh-sha2-nistp256',
            'diffie-hellman-group-exchange-sha256',
          ] }
        end

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('ssh kex')
              .with(
                ensure: 'present',
                path:   '/etc/ssh/sshd_config',
                line:   'KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256', # rubocop:disable Metrics/LineLength
                match:  '^#?KexAlgorithms',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('ssh kex')
          }
        end
      end

      context "on #{os} with invalid kex" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'approved_kex' => ['invalid@ssh.com'] }
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
