# @summary CIS Red Hat Enterprise Linux 7 Benchmark
#
# @api public
#
# @param include_rules Which rules to include
# @param exclude_rules Which rules to exclude
# @param exclude_x_window_packages Which X window packages to exclude from removal
# @param grub_config_files Grub configuration
# @param aide_command Command used to invoke aide
# @param su_group The default group for sudo rights
# @param time_servers Array of valid NTP Time servers
# @param logging How logging is done
# @param logging_host Which host should logging be sent to
# @param exclude_logs What logs files to exclude from management
# @param is_logging_host Is this host a logging host
# @param max_log_file Maximum log file
# @param max_auth_tries How many authorization attempts to allow
# @param max_sessions How many SSH sessions to allow
# @param max_startups  How many SSH startups to allow
# @param time_sync Which NTP program to use
# @param mta Which Mail Transfer program to use
# @param mac Which Mandatory Access Control to use
# @param firewall Which Firewall provider to use
# @param ipv6_enabled Should ipv6 be enabled
# @param approved_ciphers Which SSH Ciphers are approved for use
# @param approved_kex Which SSH Key Exchange algorithms are approved for use.
# @param approved_mac_algorithms Which SSH MAC algorigthms are approved for use
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
# @param timeout Number of seconds of inactivity after which a shell terminates.
# @param repolist List of acceptable software repos
# @param banner Optional string to be content of /etc/issue, /etc/issue.net (and /etc/motd if $motd not defined)
# @param motd Optional string to be content of /etc/motd.  If $banner is defined and $motd is not, $banner becomes content of /etc/motd
# @param auto_restart If an automatic restart should occur when defined classes require a reboot to take effect
# @param grub_username Account name to authenticate against - defaults to root
# @param grub_pbkdf2_password_hash String with value of pwssword in GRUB PBKDF2 format
# @param schedule If you want to change when this runs use a scheduler
# @param nologin_whitelist Array of accounts to allow login shell other than nologin
#
# @example
#   include secure_linux_cis
class secure_linux_cis (
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
  Array[Stdlib::Host]                     $time_servers,
  Array[String]                           $approved_kex,
  Array[String]                           $approved_mac_algorithms,
  Struct[
    {
      Optional[period]      => Enum['hourly', 'daily', 'weekly', 'monthly', 'never'],
      Optional[periodmatch] => Enum['number', 'distance'],
      Optional[range]       => String[1],
      Optional[repeat]      => Integer,
      Optional[weekday]     => Variant[Array, String[1]],
    }
  ]                                       $hardening_schedule,
  Enum['workstation', 'server']           $profile_type       = 'server',
  Enum['1', '2']                          $enforcement_level = '1',
  Enum['drop', 'block', 'public', 'external', 'dmz', 'work', 'home', 'internal', 'trusted'] $default_firewalld_zone = 'drop',
  Array[String]                           $include_rules           = [],
  Array[String]                           $exclude_rules           = [],
  Optional[Array[String]]                 $exclude_x_window_packages = undef,
  Array[String]                           $workstation_level_1     = [],
  Array[String]                           $workstation_level_2     = [],
  Array[String]                           $server_level_1          = [],
  Array[String]                           $server_level_2          = [],
  Boolean                                 $auto_restart            = false,
  String                                  $grub_username           = root,
  Optional[String]                        $grub_pbkdf2_password_hash = undef,
  Enum['rsyslog', 'syslog-ng', 'none']    $logging                 = 'rsyslog',
  String                                  $logging_host            = '',  #lint:ignore:empty_string_assignment
  Boolean                                 $is_logging_host         = false,
  Array[Stdlib::Unixpath]                 $exclude_logs            = [],
  Integer                                 $max_log_file            = 32,
  Integer[1,4]                            $max_auth_tries          = 4,
  Integer[1,10]                           $max_sessions            = 4,
  String                                  $max_startups            = '10:30:60',
  Enum['ntp', 'chrony', 'none']           $time_sync               = 'ntp',
  Enum['postfix', 'exim', 'none']         $mta                     = 'postfix',
  Enum['selinux', 'apparmor', 'none']     $mac                     = 'selinux',
  Enum['enforcing', 'permissive']         $selinux_mode            = 'enforcing',
  Enum['nftables','iptables']             $firewall                = 'iptables',
  Boolean                                 $ipv6_enabled            = false,
  Array[String]                           $approved_ciphers        = [
    'aes256-gcm@openssh.com',
    'aes128-gcm@openssh.com',
    'aes128-ctr',
    'aes192-ctr',
    'aes256-ctr',
  ],
  Integer                                 $client_alive_interval   = 300, # must be between 1 and 300
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
  Integer                                 $timeout                 = 600,
  Array                                   $repolist                = ['updates/7/x86_64','rhel-7-server-rpms/7Server/x86_64'],
  Optional[String]                        $banner                  = undef,
  Optional[String]                        $motd                    = undef,
  Array[String]                           $nologin_whitelist       = [],
) {
  schedule { 'harden_schedule':
    period      => $hardening_schedule['period'],
    periodmatch => $hardening_schedule['periodmatch'],
    range       => $hardening_schedule['range'],
    repeat      => $hardening_schedule['repeat'],
    weekday     => $hardening_schedule['weekday'],
  }

  $base_rules = $profile_type ? {
    'workstation' => $enforcement_level ? {
      '1' => $workstation_level_1,
      '2' => $workstation_level_2,
    },
    'server' => $enforcement_level ? {
      '1' => $server_level_1,
      '2' => $server_level_2,
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
  $enforced_rules = $base_rules.map | String $line | {
    "secure_linux_cis::rules::${line}"
  } # + $include_rules - $exclude_rules

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
}
