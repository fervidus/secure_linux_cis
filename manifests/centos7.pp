# This is a wrapper class that declares the CIS controls for CentOS Linux 7
#
# The CentOS Linux 7 CIS Benchmark is updated for version: 2.2.0
#
# The benchmark can be found here:
# https://downloads.cisecurity.org/
#
# @summary This wrapper class declares CIS controls for the CentOS Linux 7 Benchmark v2.2.0. Most of the classes are inherited from the
# redhat7 manifest, as the two have nearly identical benchmarks
#
# @param time_servers Array of valid NTP Time servers
# @param logging How logging is done
# @param logging_host Which host should logging be sent to
# @param is_logging_host Is this host a logging host
# @param max_log_file Maximum log file
# @param max_auth_tries How many authorization attempts to allow
# @param time_sync Which NTP program to use
# @param mta Which Mail Transfer program to use
# @param mac Which Mandatory Access Control to use
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
#   include secure_linux_cis::centos7
class secure_linux_cis::centos7 (
  Array[String]                         $time_servers            = [],
  Enum['rsyslog', 'syslog-ng', 'none']  $logging                 = 'rsyslog',
  String                                $logging_host            = '',  #lint:ignore:empty_string_assignment
  Boolean                               $is_logging_host         = false,
  Integer                               $max_log_file            = 32,
  Integer[1,4]                          $max_auth_tries          = 4,
  Enum['ntp', 'chrony', 'none']         $time_sync               = 'ntp',
  Enum['postfix', 'exim', 'none']       $mta                     = 'postfix',
  Enum['selinux', 'apparmor', 'none']   $mac                     = 'selinux',
  Boolean                               $ipv6_enabled            = false,
  Array                                 $approved_mac_algorithms =
    ['hmac-sha2-512-etm@openssh.com','hmac-sha2-256-etm@openssh.com','umac-128-etm@openssh.com',
  'hmac-sha2-512','hmac-sha2-256','umac-128@openssh.com'],
  Integer                               $client_alive_interval   = 300,
  Integer[0,3]                          $client_alive_count_max  = 0,
  Integer                               $login_grace_time        = 60,
  Array[String]                         $allow_users             = [],
  Array[String]                         $allow_groups            = [],
  Array[String]                         $deny_users              = [],
  Array[String]                         $deny_groups             = [],
  Integer                               $minlen                  = 14,
  Integer                               $dcredit                 = -1,
  Integer                               $ucredit                 = -1,
  Integer                               $ocredit                 = -1,
  Integer                               $lcredit                 = -1,
  Integer                               $attempts                = 5,
  Integer                               $lockout_time            = 900,
  Integer                               $past_passwords          = 5,
  Integer                               $pass_max_days           = 90,
  Integer                               $pass_min_days           = 7,
  Integer                               $pass_warn_days          = 7,
  Integer                               $pass_inactive_days      = 30,
  Array                                 $repolist                = ['updates/7/x86_64'],
  Optional[String]                      $banner                  = undef,
  Optional[String]                      $motd                    = undef,
  Boolean                               $auto_restart            = false,
) {

  # Set default path for execs if not otherwise specified
  Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/' }

  # 1.1.1.1
  include ::secure_linux_cis::redhat7::cis_1_1_1_1
  # 1.1.1.2
  include ::secure_linux_cis::redhat7::cis_1_1_1_2
  # 1.1.1.3
  include ::secure_linux_cis::redhat7::cis_1_1_1_3
  # 1.1.1.4
  include ::secure_linux_cis::redhat7::cis_1_1_1_4
  # 1.1.1.5
  include ::secure_linux_cis::redhat7::cis_1_1_1_5
  # 1.1.1.6
  include ::secure_linux_cis::redhat7::cis_1_1_1_6
  # 1.1.1.7
  include ::secure_linux_cis::redhat7::cis_1_1_1_7
  # 1.1.1.8
  include ::secure_linux_cis::redhat7::cis_1_1_1_8
  # 1.1.2
  include ::secure_linux_cis::redhat7::cis_1_1_2
  # 1.1.3
  include ::secure_linux_cis::redhat7::cis_1_1_3
  # 1.1.4
  include ::secure_linux_cis::redhat7::cis_1_1_4
  # 1.1.5
  include ::secure_linux_cis::redhat7::cis_1_1_5
  # 1.1.6
  include ::secure_linux_cis::redhat7::cis_1_1_6
  # 1.1.7
  include ::secure_linux_cis::redhat7::cis_1_1_7
  # 1.1.8
  include ::secure_linux_cis::redhat7::cis_1_1_8
  # 1.1.9
  include ::secure_linux_cis::redhat7::cis_1_1_9
  # 1.1.10
  include ::secure_linux_cis::redhat7::cis_1_1_10
  # 1.1.11
  include ::secure_linux_cis::redhat7::cis_1_1_11
  # 1.1.12
  include ::secure_linux_cis::redhat7::cis_1_1_12
  # 1.1.13
  include ::secure_linux_cis::redhat7::cis_1_1_13
  # 1.1.14
  include ::secure_linux_cis::redhat7::cis_1_1_14
  # 1.1.15
  include ::secure_linux_cis::redhat7::cis_1_1_15
  # # 1.1.16
  # include ::secure_linux_cis::redhat7::cis_1_1_16
  # # 1.1.17
  # include ::secure_linux_cis::redhat7::cis_1_1_17
  # # 1.1.18
  # include ::secure_linux_cis::redhat7::cis_1_1_18
  # # 1.1.19
  # include ::secure_linux_cis::redhat7::cis_1_1_19
  # # 1.1.20
  # include ::secure_linux_cis::redhat7::cis_1_1_20
  # 1.1.21
  include ::secure_linux_cis::redhat7::cis_1_1_21
  # 1.1.22
  include ::secure_linux_cis::redhat7::cis_1_1_22
  # 1.2.1
  # class { '::secure_linux_cis::redhat7::cis_1_2_1':
  #   repolist => $repolist,
  # }
  # 1.2.2
  include ::secure_linux_cis::redhat7::cis_1_2_2
  # 1.2.3
  # include ::secure_linux_cis::redhat7::cis_1_2_3
  # 1.3.1
  include ::secure_linux_cis::redhat7::cis_1_3_1
  # 1.3.2
  include ::secure_linux_cis::redhat7::cis_1_3_2
  # 1.4.1
  include ::secure_linux_cis::redhat7::cis_1_4_1
  # 1.4.2
  include ::secure_linux_cis::redhat7::cis_1_4_2
  # 1.4.3
  include ::secure_linux_cis::redhat7::cis_1_4_3
  # 1.5.1
  include ::secure_linux_cis::redhat7::cis_1_5_1
  # 1.5.2
  # include ::secure_linux_cis::redhat7::cis_1_5_2
  # 1.5.3
  include ::secure_linux_cis::redhat7::cis_1_5_3
  # 1.5.4
  include ::secure_linux_cis::redhat7::cis_1_5_4
  # 1.6.1.1
  include ::secure_linux_cis::redhat7::cis_1_6_1_1
  # 1.6.1.2
  class { '::secure_linux_cis::redhat7::cis_1_6_1_2':
    mac => 'selinux',
  }
  # 1.6.1.3
  class { '::secure_linux_cis::redhat7::cis_1_6_1_3':
    mac => 'selinux',
  }
  # 1.6.1.4
  include ::secure_linux_cis::redhat7::cis_1_6_1_4
  # 1.6.1.5
  include ::secure_linux_cis::redhat7::cis_1_6_1_5
  # 1.6.1.6
  include ::secure_linux_cis::redhat7::cis_1_6_1_6
  # 1.6.2
  include ::secure_linux_cis::redhat7::cis_1_6_2
  # 1.7.1.1
  include ::secure_linux_cis::redhat7::cis_1_7_1_1
  # 1.7.1.2
  include ::secure_linux_cis::redhat7::cis_1_7_1_2
  # 1.7.1.3
  include ::secure_linux_cis::redhat7::cis_1_7_1_3

  # 1.7.1.4
  class { '::secure_linux_cis::redhat7::cis_1_7_1_4':
    banner => $banner,
    motd   => $motd,
  }

  # 1.7.1.5
  class { '::secure_linux_cis::redhat7::cis_1_7_1_5':
    banner => $banner,
  }

  # 1.7.1.6
  class { '::secure_linux_cis::redhat7::cis_1_7_1_6':
    banner => $banner,
  }

  # 1.7.2
  include ::secure_linux_cis::redhat7::cis_1_7_2
  # 1.8
  include ::secure_linux_cis::redhat7::cis_1_8
  # 2.1.1
  include ::secure_linux_cis::redhat7::cis_2_1_1
  # 2.1.2
  include ::secure_linux_cis::redhat7::cis_2_1_2
  # 2.1.3
  include ::secure_linux_cis::redhat7::cis_2_1_3
  # 2.1.4
  include ::secure_linux_cis::redhat7::cis_2_1_4
  # 2.1.5
  include ::secure_linux_cis::redhat7::cis_2_1_5
  # 2.1.6
  include ::secure_linux_cis::redhat7::cis_2_1_6
  # 2.1.7
  include ::secure_linux_cis::redhat7::cis_2_1_7

  # 2.2.1.2
  class { '::secure_linux_cis::redhat7::cis_2_2_1_2':
    time_servers => $time_servers,
    time_sync    => $time_sync,
  }

  # 2.2.1.3
  class { '::secure_linux_cis::redhat7::cis_2_2_1_3':
    time_servers => $time_servers,
    time_sync    => $time_sync,
  }

  # 2.2.2
  include ::secure_linux_cis::redhat7::cis_2_2_2
  # 2.2.3
  include ::secure_linux_cis::redhat7::cis_2_2_3
  # 2.2.4
  include ::secure_linux_cis::redhat7::cis_2_2_4
  # 2.2.5
  include ::secure_linux_cis::redhat7::cis_2_2_5
  # 2.2.6
  include ::secure_linux_cis::redhat7::cis_2_2_6
  # 2.2.7
  include ::secure_linux_cis::redhat7::cis_2_2_7
  # 2.2.8
  include ::secure_linux_cis::redhat7::cis_2_2_8
  # 2.2.9
  include ::secure_linux_cis::redhat7::cis_2_2_9
  # 2.2.10
  include ::secure_linux_cis::redhat7::cis_2_2_10
  # 2.2.11
  include ::secure_linux_cis::redhat7::cis_2_2_11
  # 2.2.12
  include ::secure_linux_cis::redhat7::cis_2_2_12
  # 2.2.13
  include ::secure_linux_cis::redhat7::cis_2_2_13
  # 2.2.14
  include ::secure_linux_cis::redhat7::cis_2_2_14
  # 2.2.15
  class { '::secure_linux_cis::redhat7::cis_2_2_15':
    mta => $mta,
  }

  # 2.2.16
  include ::secure_linux_cis::redhat7::cis_2_2_16
  # 2.2.17
  include ::secure_linux_cis::redhat7::cis_2_2_17
  # 2.2.18
  include ::secure_linux_cis::redhat7::cis_2_2_19
  # 2.2.19
  include ::secure_linux_cis::redhat7::cis_2_2_20
  # 2.2.20
  include ::secure_linux_cis::redhat7::cis_2_2_21
  # 2.2.21
  include ::secure_linux_cis::redhat7::cis_2_2_18
  # 2.3.1
  include ::secure_linux_cis::redhat7::cis_2_3_1
  # 2.3.2
  include ::secure_linux_cis::redhat7::cis_2_3_2
  # 2.3.3
  include ::secure_linux_cis::redhat7::cis_2_3_3
  # 2.3.4
  include ::secure_linux_cis::redhat7::cis_2_3_4
  # 2.3.5
  include ::secure_linux_cis::redhat7::cis_2_3_5
  # 3.1.1
  include ::secure_linux_cis::redhat7::cis_3_1_1
  # 3.1.2
  include ::secure_linux_cis::redhat7::cis_3_1_2
  # 3.2.1
  include ::secure_linux_cis::redhat7::cis_3_2_1
  # 3.2.2
  include ::secure_linux_cis::redhat7::cis_3_2_2
  # 3.2.3
  include ::secure_linux_cis::redhat7::cis_3_2_3
  # 3.2.4
  include ::secure_linux_cis::redhat7::cis_3_2_4
  # 3.2.5
  include ::secure_linux_cis::redhat7::cis_3_2_5
  # 3.2.6
  include ::secure_linux_cis::redhat7::cis_3_2_6
  # 3.2.7
  include ::secure_linux_cis::redhat7::cis_3_2_7
  # 3.2.8
  include ::secure_linux_cis::redhat7::cis_3_2_8

  # 3.3.1
  class { '::secure_linux_cis::redhat7::cis_3_3_1':
    ipv6_enabled => $ipv6_enabled,
  }

  # 3.3.2
  class { '::secure_linux_cis::redhat7::cis_3_3_2':
    ipv6_enabled => $ipv6_enabled,
  }

  # 3.3.3
  class { '::secure_linux_cis::redhat7::cis_3_3_3':
    ipv6_enabled => $ipv6_enabled,
  }

  # 3.4.1
  include ::secure_linux_cis::redhat7::cis_3_4_1
  # 3.4.2
  include ::secure_linux_cis::redhat7::cis_3_4_2
  # 3.4.3
  include ::secure_linux_cis::redhat7::cis_3_4_3
  # 3.4.4
  include ::secure_linux_cis::redhat7::cis_3_4_4
  # 3.4.5
  include ::secure_linux_cis::redhat7::cis_3_4_5
  # 3.5.1
  include ::secure_linux_cis::redhat7::cis_3_5_1
  # 3.5.2
  include ::secure_linux_cis::redhat7::cis_3_5_2
  # 3.5.3
  include ::secure_linux_cis::redhat7::cis_3_5_3
  # 3.5.4
  include ::secure_linux_cis::redhat7::cis_3_5_4
  # 3.6.1
  include ::secure_linux_cis::redhat7::cis_3_6_1
  # 3.6.2
  include ::secure_linux_cis::redhat7::cis_3_6_2
  # 3.6.3
  include ::secure_linux_cis::redhat7::cis_3_6_3
  # 3.6.4
  include ::secure_linux_cis::redhat7::cis_3_6_4
  # 3.6.5
  include ::secure_linux_cis::redhat7::cis_3_6_5

  # Set order for firewall rules to be applied
  Class['::secure_linux_cis::redhat7::cis_3_6_1']
  -> Class['::secure_linux_cis::redhat7::cis_3_6_3']
  -> Class['::secure_linux_cis::redhat7::cis_3_6_4']
  -> Class['::secure_linux_cis::redhat7::cis_3_6_5']
  -> Class['::secure_linux_cis::redhat7::cis_3_6_2']

  # 3.7
  include ::secure_linux_cis::redhat7::cis_3_7

  # 4.1.1.1
  class { '::secure_linux_cis::redhat7::cis_4_1_1_1':
    max_log_file => $max_log_file,
  }

  # 4.1.1.2
  include ::secure_linux_cis::redhat7::cis_4_1_1_2
  # 4.1.1.3
  include ::secure_linux_cis::redhat7::cis_4_1_1_3
  # 4.1.2
  include ::secure_linux_cis::redhat7::cis_4_1_2
  # 4.1.3
  include ::secure_linux_cis::redhat7::cis_4_1_3
  # 4.1.4
  include ::secure_linux_cis::redhat7::cis_4_1_4
  # 4.1.5
  include ::secure_linux_cis::redhat7::cis_4_1_5
  # 4.1.6
  include ::secure_linux_cis::redhat7::cis_4_1_6
  # 4.1.7
  include ::secure_linux_cis::redhat7::cis_4_1_7
  # 4.1.8
  include ::secure_linux_cis::redhat7::cis_4_1_8
  # 4.1.9
  include ::secure_linux_cis::redhat7::cis_4_1_9
  # 4.1.10
  include ::secure_linux_cis::redhat7::cis_4_1_10
  # 4.1.11
  include ::secure_linux_cis::redhat7::cis_4_1_11
  # # 4.1.12
  include ::secure_linux_cis::redhat7::cis_4_1_12
  # 4.1.13
  include ::secure_linux_cis::redhat7::cis_4_1_13
  # 4.1.14
  include ::secure_linux_cis::redhat7::cis_4_1_14
  # 4.1.15
  include ::secure_linux_cis::redhat7::cis_4_1_15
  # 4.1.16
  include ::secure_linux_cis::redhat7::cis_4_1_16
  # 4.1.17
  include ::secure_linux_cis::redhat7::cis_4_1_17
  # # 4.1.18
  include ::secure_linux_cis::redhat7::cis_4_1_18

  # 4.2.1.1
  class { '::secure_linux_cis::redhat7::cis_4_2_1_1':
    logging => $logging,
  }

  # 4.2.1.2
  class { '::secure_linux_cis::redhat7::cis_4_2_1_2':
    logging => $logging,
  }

  # 4.2.1.3
  class { '::secure_linux_cis::redhat7::cis_4_2_1_3':
    logging => $logging,
  }

  # 4.2.1.4
  class { '::secure_linux_cis::redhat7::cis_4_2_1_4':
    logging      => $logging,
    logging_host => $logging_host,
  }

  # 4.2.1.5
  class { '::secure_linux_cis::redhat7::cis_4_2_1_5':
    logging         => $logging,
    is_logging_host => $is_logging_host,
  }

  # 4.2.2.1
  class { '::secure_linux_cis::redhat7::cis_4_2_2_1':
    logging => $logging,
  }

  # 4.2.2.2
  class { '::secure_linux_cis::redhat7::cis_4_2_2_2':
    logging => $logging,
  }

  # 4.2.2.3
  class { '::secure_linux_cis::redhat7::cis_4_2_2_3':
    logging => $logging,
  }

  # 4.2.2.4
  class { '::secure_linux_cis::redhat7::cis_4_2_2_4':
    logging      => $logging,
    logging_host => $logging_host,
  }

  # 4.2.2.5
  class { '::secure_linux_cis::redhat7::cis_4_2_2_5':
    logging         => $logging,
    is_logging_host => $is_logging_host,
  }

  # 4.2.3
  class { '::secure_linux_cis::redhat7::cis_4_2_3':
    logging => $logging,
  }

  # 4.2.4
  class { '::secure_linux_cis::redhat7::cis_4_2_4': }

  # 4.3
  include ::secure_linux_cis::redhat7::cis_4_3
  # 5.1.1
  include ::secure_linux_cis::redhat7::cis_5_1_1
  # 5.1.2
  include ::secure_linux_cis::redhat7::cis_5_1_2
  # 5.1.3
  include ::secure_linux_cis::redhat7::cis_5_1_3
  # 5.1.4
  include ::secure_linux_cis::redhat7::cis_5_1_4
  # 5.1.5
  include ::secure_linux_cis::redhat7::cis_5_1_5
  # 5.1.6
  include ::secure_linux_cis::redhat7::cis_5_1_6
  # 5.1.7
  include ::secure_linux_cis::redhat7::cis_5_1_7
  # 5.1.8
  include ::secure_linux_cis::redhat7::cis_5_1_8
  # 5.2.1
  include ::secure_linux_cis::redhat7::cis_5_2_1
  # 5.2.2
  include ::secure_linux_cis::redhat7::cis_5_2_2
  # 5.2.3
  include ::secure_linux_cis::redhat7::cis_5_2_3
  # 5.2.4
  include ::secure_linux_cis::redhat7::cis_5_2_4

  # 5.2.5
  class { '::secure_linux_cis::redhat7::cis_5_2_5':
    max_auth_tries => $max_auth_tries,
  }

  # 5.2.6
  include ::secure_linux_cis::redhat7::cis_5_2_6
  # 5.2.7
  include ::secure_linux_cis::redhat7::cis_5_2_7
  # 5.2.8
  include ::secure_linux_cis::redhat7::cis_5_2_8
  # 5.2.9
  include ::secure_linux_cis::redhat7::cis_5_2_9
  # 5.2.10
  include ::secure_linux_cis::redhat7::cis_5_2_10

  # 5.2.11
  class { '::secure_linux_cis::redhat7::cis_5_2_11':
    approved_mac_algorithms => $approved_mac_algorithms,
  }

  # 5.2.12
  class { '::secure_linux_cis::redhat7::cis_5_2_12':
    client_alive_interval  => $client_alive_interval,
    client_alive_count_max => $client_alive_count_max,
  }

  # 5.2.13
  class { '::secure_linux_cis::redhat7::cis_5_2_13':
    login_grace_time => $login_grace_time,
  }

  # 5.2.14
  class { '::secure_linux_cis::redhat7::cis_5_2_14':
    allow_users  => $allow_users,
    allow_groups => $allow_groups,
    deny_users   => $deny_users,
    deny_groups  => $deny_groups,
  }

  # 5.2.15
  include ::secure_linux_cis::redhat7::cis_5_2_15

  # 5.3.1
  class { '::secure_linux_cis::redhat7::cis_5_3_1':
    minlen  => $minlen,
    dcredit => $dcredit,
    ucredit => $ucredit,
    ocredit => $ocredit,
    lcredit => $lcredit,
  }

  # 5.3.2
  class { '::secure_linux_cis::redhat7::cis_5_3_2':
    attempts     => $attempts,
    lockout_time => $lockout_time,
  }

  # 5.3.3
  class { '::secure_linux_cis::redhat7::cis_5_3_3':
    past_passwords => $past_passwords,
  }

  # 5.3.4
  include ::secure_linux_cis::redhat7::cis_5_3_4

  # 5.4.1.1
  class { '::secure_linux_cis::redhat7::cis_5_4_1_1':
    pass_max_days => $pass_max_days,
  }

  # 5.4.1.2
  class { '::secure_linux_cis::redhat7::cis_5_4_1_2':
    pass_min_days => $pass_min_days,
  }

  # 5.4.1.3
  class { '::secure_linux_cis::redhat7::cis_5_4_1_3':
    pass_warn_days => $pass_warn_days,
  }

  # 5.4.1.4
  include ::secure_linux_cis::redhat7::cis_5_4_1_4
  # 5.4.1.5
  include ::secure_linux_cis::redhat7::cis_5_4_1_5
  # 5.4.2
  include ::secure_linux_cis::redhat7::cis_5_4_2
  # 5.4.3
  include ::secure_linux_cis::redhat7::cis_5_4_3
  # 5.4.4
  include ::secure_linux_cis::redhat7::cis_5_4_4
  # 5.4.5
  include ::secure_linux_cis::redhat7::cis_5_4_5
  # # 5.5
  # include ::secure_linux_cis::redhat7::cis_5_5
  # 5.6
  include ::secure_linux_cis::redhat7::cis_5_6
  # 6.1.1
  # include ::secure_linux_cis::redhat7::cis_6_1_1
  # 6.1.2
  include ::secure_linux_cis::redhat7::cis_6_1_2
  # 6.1.3
  include ::secure_linux_cis::redhat7::cis_6_1_3
  # 6.1.4
  include ::secure_linux_cis::redhat7::cis_6_1_4
  # 6.1.5
  include ::secure_linux_cis::redhat7::cis_6_1_5
  # 6.1.6
  include ::secure_linux_cis::redhat7::cis_6_1_6
  # 6.1.7
  include ::secure_linux_cis::redhat7::cis_6_1_7
  # 6.1.8
  include ::secure_linux_cis::redhat7::cis_6_1_8
  # 6.1.9
  include ::secure_linux_cis::redhat7::cis_6_1_9
  # 6.1.10
  include ::secure_linux_cis::redhat7::cis_6_1_10
  # 6.1.11
  include ::secure_linux_cis::redhat7::cis_6_1_11
  # 6.1.12
  include ::secure_linux_cis::redhat7::cis_6_1_12
  # 6.1.13
  # include ::secure_linux_cis::redhat7::cis_6_1_13
  # 6.1.14
  # include ::secure_linux_cis::redhat7::cis_6_1_14
  # 6.2.1
  # include ::secure_linux_cis::redhat7::cis_6_2_1
  # 6.2.2
  include ::secure_linux_cis::redhat7::cis_6_2_2
  # 6.2.3
  include ::secure_linux_cis::redhat7::cis_6_2_3
  # 6.2.4
  include ::secure_linux_cis::redhat7::cis_6_2_4
  # 6.2.5
  include ::secure_linux_cis::redhat7::cis_6_2_5
  # 6.2.6
  include ::secure_linux_cis::redhat7::cis_6_2_6

  file { '/usr/share/cis_scripts':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  # 6.2.7
  include ::secure_linux_cis::redhat7::cis_6_2_7
  # 6.2.8
  include ::secure_linux_cis::redhat7::cis_6_2_8
  # 6.2.9
  include ::secure_linux_cis::redhat7::cis_6_2_9
  # 6.2.10
  include ::secure_linux_cis::redhat7::cis_6_2_10
  # 6.2.11
  include ::secure_linux_cis::redhat7::cis_6_2_11
  # 6.2.12
  include ::secure_linux_cis::redhat7::cis_6_2_12
  # 6.2.13
  include ::secure_linux_cis::redhat7::cis_6_2_13
  # 6.2.14
  include ::secure_linux_cis::redhat7::cis_6_2_14
  # 6.2.15
  include ::secure_linux_cis::redhat7::cis_6_2_15
  # 6.2.16
  include ::secure_linux_cis::redhat7::cis_6_2_16
  # 6.2.17
  include ::secure_linux_cis::redhat7::cis_6_2_17
  # 6.2.18
  include ::secure_linux_cis::redhat7::cis_6_2_18
  # 6.2.19
  include ::secure_linux_cis::redhat7::cis_6_2_19

  # define classes that change resources requiring a reboot to take effect, as using pkill is undesirable.
  if $auto_restart {
    $restart_classes = [
      'Class[Secure_linux_cis::Redhat7::Cis_1_6_1_1]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_3]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_4]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_5]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_6]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_7]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_8]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_9]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_10]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_11]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_13]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_14]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_15]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_16]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_17]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_1_18]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_2_1_2]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_2_1_3]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_2_1_4]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_2_1_5]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_2_2_2]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_2_2_3]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_2_2_4]',
      'Class[Secure_linux_cis::Redhat7::Cis_4_2_2_5]',
    ]

    reboot { 'after_run':
      apply     => 'finished',
      timeout   => 60,
      subscribe => $restart_classes,
    }
  }
}
