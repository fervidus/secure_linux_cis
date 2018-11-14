require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_2_12' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} with default parameters" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'client_alive_interval' => 300, 'client_alive_count_max' => '3' }
        end

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('ssh alive interval')
              .with(
                ensure: 'present',
                path:   '/etc/ssh/sshd_config',
                line:   'ClientAliveInterval 300',
                match:  '^#?ClientAliveInterval',
              )
            is_expected.to contain_file_line('ssh alive count max')
              .with(
                ensure: 'present',
                path:   '/etc/ssh/sshd_config',
                line:   'ClientAliveCountMax 3',
                match:  '^#?ClientAliveCountMax',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('ssh alive interval')
            is_expected.not_to contain_file_line('ssh alive count max')
          }
        end
      end
      context "on #{os} with invalid alive interval (high)" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'client_alive_interval' => 315, 'client_alive_count_max' => '3' }
        end

        if option
          it { is_expected.not_to compile }
        else
          it { is_expected.to compile }
        end
      end
      context "on #{os} with invalid alive interval (low)" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'client_alive_interval' => 0, 'client_alive_count_max' => '3' }
        end

        if option
          it { is_expected.not_to compile }
        else
          it { is_expected.to compile }
        end
      end
      context "on #{os} with invalid alive count max" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'client_alive_interval' => 0, 'client_alive_count_max' => '6' }
        end

        it { is_expected.not_to compile }
      end
    end
  end
end
