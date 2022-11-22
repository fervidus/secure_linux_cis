# frozen_string_literal: true

require 'spec_helper'
require 'puppet'

describe 'secure_linux_cis' do
  on_supported_os.each do |os, os_facts|
    Puppet::Type.type(:service).defaultprovider.has_feature :maskable if os_facts[:osfamily] == 'RedHat'
    context "on #{os} with server 1" do
      let(:facts) do
        os_facts.merge(
          {
            rsyslog_configuration_files: [],
                         ssh_host_pub_keys: [],
                         root_path: '',
          },
        )
      end

      let(:params) do
        {
          'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
        }
      end

      it { is_expected.to compile.with_all_deps }
    end

    context "on #{os} with server 2" do
      let(:facts) do
        os_facts.merge(
          {
            rsyslog_configuration_files: [],
                         ssh_host_pub_keys: [],
                         root_path: '',
          },
        )
      end

      let(:params) do
        {
          'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
          'enforcement_level' => 2,
        }
      end

      it { is_expected.to compile.with_all_deps }
    end

    context "on #{os} with workstation 1" do
      let(:facts) do
        os_facts.merge(
          {
            rsyslog_configuration_files: [],
                         ssh_host_pub_keys: [],
                         root_path: '',
          },
        )
      end

      let(:params) do
        {
          'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
          'profile_type'      => 'workstation',
        }
      end

      it { is_expected.to compile.with_all_deps }
    end

    context "on #{os} with workstation 2" do
      let(:facts) do
        os_facts.merge(
          {
            rsyslog_configuration_files: [],
                         ssh_host_pub_keys: [],
                         root_path: '',
          },
        )
      end

      let(:params) do
        {
          'time_servers'      => ['tick.usno.navy.mil', 'tock.usno.navy.mil'],
          'profile_type'      => 'workstation',
          'enforcement_level' => 2,
        }
      end

      it { is_expected.to compile.with_all_deps }
    end
  end
end
