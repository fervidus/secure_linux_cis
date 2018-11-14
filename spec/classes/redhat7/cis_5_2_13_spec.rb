require 'spec_helper'

bool_options = [true, false]

describe 'secure_linux_cis::redhat7::cis_5_2_13' do
  on_supported_os.each do |os, os_facts|
    bool_options.each do |option|
      context "on #{os} with default algorithms" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'login_grace_time' => 60 }
        end

        it { is_expected.to compile }

        if option
          it {
            is_expected.to contain_file_line('ssh login grace time')
              .with(
                ensure: 'present',
                path:   '/etc/ssh/sshd_config',
                line:   'LoginGraceTime 60',
                match:  '^#?LoginGraceTime',
              )
          }
        else
          it {
            is_expected.not_to contain_file_line('ssh login grace time')
          }
        end
      end

      context "on #{os} with invalid login grace time (high)" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'login_grace_time' => 62 }
        end

        if option
          it { is_expected.not_to compile }
        else
          it { is_expected.to compile }
        end
      end
      context "on #{os} with invalid login grace time (low)" do
        let(:facts) { os_facts }
        let(:params) do
          { 'enforced' => option, 'login_grace_time' => 0 }
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
