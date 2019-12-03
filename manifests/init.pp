# @summary CIS Red Hat Enterprise Linux 7 Benchmark
#
# @param include_rules Which rules to include
# @param grub_config_files Grub configuration
# @param aide_command Command used to invoke aide
# @param su_group The default group for sudo rights
# @param time_servers Array of valid NTP Time servers
# @param logging How logging is done
# @param logging_host Which host should logging be sent to
# @param is_logging_host Is this host a logging host
# @param max_log_file Maximum log file
# @param max_auth_tries How many authorization attempts to allow
# @param time_sync Which NTP program to use
# @param mta Which Mail Transfer program to use
# @param mac Which Mandatory Access Control to use
# @param firewall Which Firewall provider to use
# @param ipv6_enabled Should ipv6 be enabled
# @param approved_mac_algorithms Which algorigthms are approved for use
# @param client_alive_interval Client alive interval to use
# @param client_alive_count_max Maximum specificed client alive count
# @param login_grace_time Login grace time
# @param allow_users Which users to allow
# @param allow_groups Which groups to allow
# @param deny_users Which users to deny
# @param deny_groups Which groups to deny
# @param minlen Minimum length
# @param dcredit D Credit
# @param ucredit U Credit
# @param ocredit O Credit
# @param lcredit L Credit
# @param attempts Number of attempts
# @param lockout_time Amount of time for lockout
# @param past_passwords Number of previous passwords
# @param pass_max_days Password maximum days
# @param pass_min_days Password minimum days
# @param pass_warn_days Password warning days
# @param pass_inactive_days Password inactive days
# @param repolist List of acceptable software repos
# @param banner Optional string to be content of /etc/issue, /etc/issue.net (and /etc/motd if $motd not defined)
# @param motd Optional string to be content of /etc/motd.  If $banner is defined and $motd is not, $banner becomes content of /etc/motd
# @param auto_restart If an automatic restart should occur when defined classes require a reboot to take effect
#
# @example
#   include secure_linux_cis
class secure_linux_cis (
  Array[String]                           $include_rules,
  Array[String]                           $grub_config_files,
  Array[String]                           $host_allow_rules,
  Array[String]                           $host_deny_rules,
  String                                  $aide_command,
  String                                  $su_group,
  String                                  $update_command,
  Enum['tcp_wrappers', 'tcpd', 'none']    $tcp_wrappers_package,
  Enum['audit', 'auditd', 'none']         $auditd_package,
  Enum['smbd', 'smb', 'none']             $samba_service,
  Enum['cron', 'crond', 'none']           $cron_service,
  Boolean                                 $auto_restart,
  Array[Stdlib::Host]                     $time_servers,
  Array[String]                           $exclude_rules           = [],
  Enum['rsyslog', 'syslog-ng', 'none']    $logging                 = 'rsyslog',
  String                                  $logging_host            = '',  #lint:ignore:empty_string_assignment
  Boolean                                 $is_logging_host         = false,
  Integer                                 $max_log_file            = 32,
  Integer[1,4]                            $max_auth_tries          = 4,
  Enum['ntp', 'chrony', 'none']           $time_sync               = 'ntp',
  Enum['postfix', 'exim', 'none']         $mta                     = 'postfix',
  Enum['selinux', 'apparmor', 'none']     $mac                     = 'selinux',
  Enum['firewalld','nftables','iptables'] $firewall                = 'iptables',
  Boolean                                 $ipv6_enabled            = false,
  Array                                   $approved_mac_algorithms =
    ['hmac-sha2-512-etm@openssh.com','hmac-sha2-256-etm@openssh.com','umac-128-etm@openssh.com',
  'hmac-sha2-512','hmac-sha2-256','umac-128@openssh.com'],
  # $client_alive_interval must be between 1 and 300
  Integer                                 $client_alive_interval   = 300,
  Integer[0,3]                            $client_alive_count_max  = 0,
  Integer                                 $login_grace_time        = 60,
  Array[String]                           $allow_users             = [],
  Array[String]                           $allow_groups            = [],
  Array[String]                           $deny_users              = [],
  Array[String]                           $deny_groups             = [],
  Integer                                 $minlen                  = 14,
  Integer                                 $dcredit                 = -1,
  Integer                                 $ucredit                 = -1,
  Integer                                 $ocredit                 = -1,
  Integer                                 $lcredit                 = -1,
  Integer                                 $attempts                = 5,
  Integer                                 $lockout_time            = 900,
  Integer                                 $past_passwords          = 5,
  Integer                                 $pass_max_days           = 90,
  Integer                                 $pass_min_days           = 7,
  Integer                                 $pass_warn_days          = 7,
  Integer                                 $pass_inactive_days      = 30,
  Array                                   $repolist                = ['updates/7/x86_64','rhel-7-server-rpms/7Server/x86_64'],
  Optional[String]                        $banner                  = undef,
  Optional[String]                        $motd                    = undef,
) {
  # Rules to enforce
  $enforced_rules = $include_rules - $exclude_rules

  file { '/usr/share/cis_scripts':
    ensure => directory,
  }

  include $enforced_rules

  Class['::Secure_linux_cis::Rules::Ensure_auditd_service_is_enabled']
  -> Class['::Secure_linux_cis::Rules::Ensure_audit_log_storage_size_is_configured']

  Class['::Secure_linux_cis::Rules::Ensure_auditd_service_is_enabled']
  -> Class['::Secure_linux_cis::Rules::Ensure_audit_logs_are_not_automatically_deleted']

  Class['::Secure_linux_cis::Rules::Ensure_auditd_service_is_enabled']
  -> Class['::Secure_linux_cis::Rules::Ensure_system_is_disabled_when_audit_logs_are_full']

  # define classes that change resources requiring a reboot to take effect, as using pkill is undesirable.
  # note that cis_4_1_12 is not among this array
  if $auto_restart {
    $restart_classes = [
      Class['secure_linux_cis::rules::ensure_selinux_is_not_disabled_in_bootloader_configuration'],
      Class['secure_linux_cis::rules::ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled'],
      Class['secure_linux_cis::rules::ensure_events_that_modify_date_and_time_information_are_collected'],
      Class['secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected'],
      Class['secure_linux_cis::rules::ensure_events_that_modify_the_system_s_network_environment_are_collected'],
      Class['secure_linux_cis::rules::ensure_events_that_modify_the_system_s_mandatory_access_controls_are_collected'],
      Class['secure_linux_cis::rules::ensure_login_and_logout_events_are_collected'],
      Class['secure_linux_cis::rules::ensure_session_initiation_information_is_collected'],
      Class['secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected'],
      Class['secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected'],
      Class['secure_linux_cis::rules::ensure_successful_file_system_mounts_are_collected'],
      Class['secure_linux_cis::rules::ensure_file_deletion_events_by_users_are_collected'],
      Class['secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected'],
      Class['secure_linux_cis::rules::ensure_system_administrator_actions_sudolog_are_collected'],
      Class['secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected'],
      Class['secure_linux_cis::rules::ensure_the_audit_configuration_is_immutable'],
      Class['secure_linux_cis::rules::ensure_logging_is_configured'],
      Class['secure_linux_cis::rules::ensure_rsyslog_default_file_permissions_configured'],
      Class['secure_linux_cis::rules::ensure_rsyslog_is_configured_to_send_logs_to_a_remote_log_host'],
      Class['secure_linux_cis::rules::ensure_remote_rsyslog_messages_are_only_accepted_on_designated_log_hosts'],
      Class['secure_linux_cis::rules::ensure_logging_is_configured'],
      Class['secure_linux_cis::rules::ensure_syslog_ng_default_file_permissions_configured'],
      Class['secure_linux_cis::rules::ensure_syslog_ng_is_configured_to_send_logs_to_a_remote_log_host'],
      Class['secure_linux_cis::rules::ensure_remote_syslog_ng_messages_are_only_accepted_on_designated_log_hosts'],
    ]

    reboot { 'after_run':
      apply     => 'finished',
      timeout   => 60,
      subscribe => $restart_classes,
    }
  }

}
