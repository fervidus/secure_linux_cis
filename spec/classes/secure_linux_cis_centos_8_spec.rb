require 'spec_helper'

describe 'secure_linux_cis' do
  test_on = {
    supported_os: [
      {
        'operatingsystem'        => 'CentOS',
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

    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_17') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_18') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_19') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_20') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_21') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_22') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_23') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_1_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_3_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_3_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_3_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_4_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_4_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_5_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_5_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_5_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_6_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_6_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_8_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_8_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_8_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_8_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_8_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_8_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_1_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_17') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_18') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_2_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_3_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_3_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_2_3_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_2_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_2_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_3_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_3_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_3_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_3_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_3_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_3_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_3_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_3_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_4_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_4_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_4_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_4_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_4_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_4_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_4_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_4_4_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_3_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_1_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_4_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_1_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_1_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_1_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_18') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_19') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_20') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_2_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_3_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_3_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_3_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_4_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_4_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_4_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_4_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_1_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_5_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_5_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_1_9') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_10') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_11') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_12') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_13') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_14') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_15') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_16') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_17') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_18') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_19') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_1') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_20') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_2') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_3') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_4') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_5') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_6') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_7') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_8') }
    it { is_expected.to contain_class('secure_linux_cis::distribution::centos8::cis_6_2_9') }

    it { is_expected.to contain_class('secure_linux_cis::rules::create_custom_authselect_profile') }
    it { is_expected.to contain_class('secure_linux_cis::rules::disable_usb_storage') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_a_firewall_package_is_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_a_table_exists') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_authselect_includes_with_faillock') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_base_chains_exist') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_default_zone_is_set') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_iptables_are_flushed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_iptables_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_default_deny_firewall_policy') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_firewall_rules_exist_for_all_open_ports') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_loopback_traffic_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ipv6_outbound_and_established_connections_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_journald_is_configured_to_compress_large_log_files') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_journald_is_configured_to_send_logs_to_rsyslog') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_journald_is_configured_to_write_logfiles_to_persistent_disk') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_network_interfaces_are_assigned_to_appropriate_zone') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nfs_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nftables_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nftables_rules_are_permanent') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_nftables_service_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_ssh_private_host_key_files_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_permissions_on_ssh_public_host_key_files_are_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rpc_is_not_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_rsyslog_is_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_shadow_group_is_empty') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_loglevel_is_appropriate') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_maxsessions_is_set_to_4_or_less') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_maxstartups_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_ssh_pam_is_enabled') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_sudo_commands_use_pty') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_sudo_is_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_sudo_log_file_exists') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_system_accounts_are_secured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_legacy') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_over_ridden') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_tmp_is_configured') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_unnecessary_services_and_ports_are_not_accepted') }
    it { is_expected.to contain_class('secure_linux_cis::rules::ensure_xinetd_is_not_installed') }
    it { is_expected.to contain_class('secure_linux_cis::rules::select_authselect_profile') }

    it { is_expected.to contain_file_line('/etc/bashrc readonly tmout') }
    it { is_expected.to contain_file_line('/etc/bashrc_export_tmout') }
    it { is_expected.to contain_file_line('/etc/bashrc_tmout') }
    it { is_expected.to contain_file_line('/etc/profile_export_tmout') }
    it { is_expected.to contain_file_line('/etc/profile_tmout') }
    it { is_expected.to contain_file_line('sudo_log_file') }
    it { is_expected.to contain_file_line('sudo_rule_pry') }
    
    it { is_expected.to contain_firewall('001 IPv6 accept all input to lo interface') }
    it { is_expected.to contain_firewall('002 IPv6 accept all output to lo interface') }
    it { is_expected.to contain_firewall('003 IPv6 drop all to lo ::/0') }
    it { is_expected.to contain_firewall('004 accept new and established ouput IPv6 tcp connections') }
    it { is_expected.to contain_firewall('005 accept new and established ouput IPv6 udp connections') }
    it { is_expected.to contain_firewall('006 accept new and established ouput IPv6 icmp connections') }
    it { is_expected.to contain_firewall('007 accept estalished input IPv6 tcp connections') }
    it { is_expected.to contain_firewall('008 accept estalished input IPv6 udp connections') }
    it { is_expected.to contain_firewall('009 accept estalished input IPv6 icmp connections') }
    it { is_expected.to contain_firewall('010 open IPv6 ssh port') }
    
    it { is_expected.to contain_kmod__install('usb-storage') }
    
    it { is_expected.to contain_notify('ensure_a_table_exists Still needs to be implemented.') }
    it { is_expected.to contain_notify('ensure_base_chains_exist Still needs to be implemented.') }
    it { is_expected.to contain_notify('ensure_iptables_are_flushed Still needs to be implemented.') }
    it { is_expected.to contain_package('sudo') }
    it { is_expected.to contain_package('xinetd') }
    it { is_expected.to contain_secure_linux_cis__mount_options('/tmp-mode=1777,strictatime,noexec,nodev,nosuid') }
    it { is_expected.to contain_service('iptables') }
    it { is_expected.to contain_service('nftables') }
    
  end
end
