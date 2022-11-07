# frozen_string_literal: true

require 'spec_helper'

describe 'secure_linux_cis' do
  on_supported_os.each do |os, os_facts|
    context "on #{os} with server 1" do
      let(:facts) do
        os_facts
      end

      let(:params) do
        {
          'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
          'profile_type'      => 'server',
          'enforcement_level' => '1',
        }
      end

      it { is_expected.to compile.with_all_deps }
    end

    context "on #{os} with server 2" do
      let(:facts) do
        os_facts
      end

      let(:params) do
        {
          'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
          'profile_type'      => 'server',
          'enforcement_level' => '2',
        }
      end

      it { is_expected.to compile.with_all_deps }
    end

    context "on #{os} with workstation 1" do
      let(:facts) do
        os_facts
      end

      let(:params) do
        {
          'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
          'profile_type'      => 'workstation',
          'enforcement_level' => '1',
        }
      end

      it { is_expected.to compile.with_all_deps }
    end

    context "on #{os} with workstation 2" do
      let(:facts) do
        os_facts
      end

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
end
