require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::debian9::cis_5_2_13' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} with default ciphers" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'approved_ciphers' => [
            'chacha20-poly1305@openssh.com',
            'aes256-gcm@openssh.com',
            'aes128-gcm@openssh.com',
            'aes256-ctr',
            'aes192-ctr',
            'aes128-ctr',
          ] }
        end

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('ssh ciphers')
              .with(
                ensure: 'present',
                path:   '/etc/ssh/sshd_config',
                line:   'Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr',
                match:  '^#?Ciphers',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('ssh ciphers')
          }
        end
      end

      context "on #{os} with invalid ciphers" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'approved_ciphers' => ['invalid@ssh.com'] }
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
