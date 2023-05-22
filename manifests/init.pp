# @summary CIS Hardening Module
#
# @api public
#
# @param include_rules             Which rules to include
# @param exclude_rules             Which rules to exclude
# @param exclude_x_window_packages Which X window packages to exclude from removal
# @param grub_config_files         Grub configuration
# @param su_group                  The default group for sudo rights
# @param time_servers              Array of valid NTP Time servers
# @param host_allow_rules          Specifies which IP addresses are permitted to connect to the host
# @param host_deny_rules           Specifies which IP addresses are not permitted to connect to the host
# @param logging_host              Which host should logging be sent to
# @param exclude_logs              What logs files to exclude from management
# @param is_logging_host           Is this host a logging host
# @param max_log_file              Maximum log file
# @param max_auth_tries            How many authorization attempts to allow
# @param max_sessions              How many SSH sessions to allow
# @param max_startups              How many SSH startups to allow
# @param time_sync                 Which NTP program to use
# @param mta                       Which Mail Transfer program to use
# @param mac                       Which Mandatory Access Control to use
# @param ipv6_enabled              Should ipv6 be enabled
# @param approved_ciphers          Which SSH Ciphers are approved for use
# @param approved_kex              Which SSH Key Exchange algorithms are approved for use.
# @param approved_mac_algorithms   Which SSH MAC algorigthms are approved for use
# @param client_alive_interval     Client alive interval to use
# @param client_alive_count_max    Maximum specificed client alive count
# @param login_grace_time          Login grace time
# @param allow_users               Which users to allow
# @param update_command            Command used to update OS packages
# @param allow_groups              Which groups to allow
# @param deny_users                Which users to deny
# @param deny_groups               Which groups to deny
# @param minlen                    Minimum length
# @param dcredit                   D Credit
# @param ucredit                   U Credit
# @param ocredit                   O Credit
# @param lcredit                   L Credit
# @param attempts                  Number of attempts
# @param lockout_time              Amount of time for lockout
# @param past_passwords            Number of previous passwords
# @param pass_max_days             Password maximum days
# @param pass_min_days             Password minimum days
# @param pass_warn_days            Password warning days
# @param pass_inactive_days        Password inactive days
# @param cron_service              Should this system use cron or crond
# @param timeout                   Number of seconds of inactivity after which a shell terminates.
# @param banner                    String to be content of /etc/issue, /etc/issue.net (and /etc/motd if $motd not defined)
# @param motd                      String to be content of /etc/motd.  If $banner is defined and $motd is not, $banner becomes content of /etc/motd
# @param auto_restart              If an automatic restart should occur when defined classes require a reboot to take effect
# @param workstation_level_1       Workstation level 1 rules for this node
# @param workstation_level_2       Workstation level 2 rules for this node
# @param server_level_1            Server level 1 rules for this node
# @param server_level_2            Server level 2 rules for this node
# @param profile_type              Is this node a server or workstation
# @param enforcement_level         Enforce level 1 or level 2 rules
# @param auditd_package            Auditd package
# @param selinux_mode              SElinux mode enforcing or permissive. Defaults to enforcing.
# @param default_firewalld_zone    Firewalld zone to default o. Defaults to drop.
# @param manage_sshd_service       Should sshd service be managed
#
class secure_linux_cis (
  Array[String]                           $grub_config_files,
  Array[String]                           $host_allow_rules,
  Array[String]                           $host_deny_rules,
  String                                  $su_group,
  Enum['cron', 'crond']                   $cron_service,
  Array[Stdlib::Host]                     $time_servers,
  Array[String]                           $approved_kex,
  Array[String]                           $approved_mac_algorithms,
  Enum['workstation', 'server']           $profile_type,
  Enum['drop', 'block', 'public', 'external', 'dmz', 'work', 'home', 'internal', 'trusted'] $default_firewalld_zone,
  Array[String]                           $include_rules,
  Array[String]                           $exclude_rules,
  Array[String]                           $exclude_x_window_packages,
  Array[String]                           $workstation_level_1,
  Array[String]                           $workstation_level_2,
  Array[String]                           $server_level_1,
  Array[String]                           $server_level_2,
  Boolean                                 $auto_restart,
  Boolean                                 $manage_sshd_service,
  String                                  $logging_host,
  String                                  $update_command,
  Boolean                                 $is_logging_host,
  Array[Stdlib::Unixpath]                 $exclude_logs,
  String                                  $max_startups,
  String                                  $auditd_package,
  Enum['ntp', 'chrony', 'systemd-timesuncd']           $time_sync,
  Enum['postfix', 'exim', 'none']         $mta,
  Enum['selinux', 'apparmor', 'none']     $mac,
  Enum['enforcing', 'permissive']         $selinux_mode,
  Boolean                                 $ipv6_enabled,
  Array[String]                           $approved_ciphers,
  String                                  $banner,
  String                                  $motd,
  Integer[1, 2]                           $enforcement_level,
  Integer                                 $max_log_file,
  Integer[1,4]                            $max_auth_tries,
  Integer[1,10]                           $max_sessions,
  Integer                                 $client_alive_interval,
  Integer[0,3]                            $client_alive_count_max,
  Integer                                 $login_grace_time,
  Integer                                 $minlen,
  Integer                                 $dcredit,
  Integer                                 $ucredit,
  Integer                                 $ocredit,
  Integer                                 $lcredit,
  Integer                                 $attempts,
  Integer                                 $lockout_time,
  Integer                                 $past_passwords,
  Integer                                 $pass_max_days,
  Integer                                 $pass_min_days,
  Integer                                 $pass_warn_days,
  Integer                                 $pass_inactive_days,
  Integer                                 $timeout,
  Array[String]                           $allow_users,
  Array[String]                           $allow_groups,
  Array[String]                           $deny_users,
  Array[String]                           $deny_groups,
) {
  $firewall = 'iptables'

  $base_rules = $profile_type ? {
    'workstation' => $enforcement_level ? {
      1 => $workstation_level_1,
      2 => $workstation_level_2,
    },
    'server' => $enforcement_level ? {
      1 => $server_level_1,
      2 => $server_level_2,
    }
  }

  # Filesystem disable configuration file
  @file { '/etc/modprobe.d/filesystem_disable.conf':
    ensure => file,
  }
  # Storage disable configuration file
  @file { '/etc/modprobe.d/storage_disable.conf':
    ensure => file,
  }

  # Build rules to enforce
  $base_rules_normalized = $base_rules.map | String $line | {
    "secure_linux_cis::rules::${line}"
  }

  $include_rules_normalized = $include_rules.map | String $line | {
    "secure_linux_cis::rules::${line}"
  }

  $exclude_rules_normalized = $exclude_rules.map | String $line | {
    "secure_linux_cis::rules::${line}"
  }

  $enforced_rules = $base_rules_normalized + $include_rules_normalized - $exclude_rules_normalized

  file { '/usr/share/cis_scripts':
    ensure   => directory,
  }

  file { '/usr/share/cis_scripts/enforced_rules.txt':
    ensure  => file,
    content => $enforced_rules.join("\n"),
  }

  file { '/root/scripts':
    ensure => directory,
    mode   => 'u+xr',
  }

  include $enforced_rules
  include secure_linux_cis::reboot
  include secure_linux_cis::refresh_mount_options
}
