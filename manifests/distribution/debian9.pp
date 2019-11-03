# This is a wrapper class that declares the CIS controls for Debian 9 (Stretch)
#
# The Debian 9 CIS Benchmark is updated for version: 1.0.0
#
# The benchmark can be found here:
# https://downloads.cisecurity.org/
#
# @summary This wrapper class declares CIS controls for the Debian Linux 9 Benchmark v1.0.0
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
#   include secure_linux_cis::debian9
class secure_linux_cis::distribution::debian9 (
  Array[String]                         $time_servers            = [],
  Enum['rsyslog', 'syslog-ng', 'none']  $logging                 = 'rsyslog',
  String                                $logging_host            = '',  #lint:ignore:empty_string_assignment
  Boolean                               $is_logging_host         = false,
  Integer                               $max_log_file            = 32,
  Integer[1,4]                          $max_auth_tries          = 4,
  Enum['ntp', 'chrony', 'none']         $time_sync               = 'ntp',
  Enum['postfix', 'exim', 'none']       $mta                     = 'exim',
  Enum['selinux', 'apparmor', 'none']   $mac                     = 'apparmor',
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
  Array                                 $repolist                = ['rhel-7-server-rpms/7Server/x86_64'],
  Optional[String]                      $banner                  = undef,
  Optional[String]                      $motd                    = undef,
  Boolean                               $auto_restart            = false,
) {

  # Set default path for execs if not otherwise specified
  Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/' }


  # Debian 1.1.1.1
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_1_2
  # Debian 1.1.1.2
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_1_3
  # Debian 1.1.1.3
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_1_4
  # Debian 1.1.1.4
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_1_5
  # Debian 1.1.1.5
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_1_7

  include ::secure_linux_cis::distribution::redhat7::cis_1_1_2
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_3
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_4
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_5
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_6
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_7
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_8
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_9
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_10
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_11
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_12
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_13
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_14
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_15
  # include ::secure_linux_cis::distribution::redhat7::cis_1_1_16
  # include ::secure_linux_cis::distribution::redhat7::cis_1_1_17
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_18
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_19
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_20
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_21
  include ::secure_linux_cis::distribution::redhat7::cis_1_1_22

  # TODO CIS 1.2.1 is not scored, and quite difficult to implement on Debian
  # class { '::secure_linux_cis::distribution::redhat7::cis_1_2_1':
  #   repolist => $repolist,
  # }

  # Debian1_2_2
  # TODO Difficult to automate, but not scored.
  # include ::secure_linux_cis::distribution::redhat7::cis_1_2_3

  include ::secure_linux_cis::distribution::redhat7::cis_1_3_1
  include ::secure_linux_cis::distribution::redhat7::cis_1_3_2

  include ::secure_linux_cis::distribution::redhat7::cis_1_4_1
  include ::secure_linux_cis::distribution::redhat7::cis_1_4_2
  include ::secure_linux_cis::distribution::debian9::cis_1_4_3

  include ::secure_linux_cis::distribution::redhat7::cis_1_5_1
  include ::secure_linux_cis::distribution::redhat7::cis_1_5_2
  include ::secure_linux_cis::distribution::redhat7::cis_1_5_3
  include ::secure_linux_cis::distribution::redhat7::cis_1_5_4

  include ::secure_linux_cis::distribution::redhat7::cis_1_6_1_1
  class { '::secure_linux_cis::distribution::redhat7::cis_1_6_1_2':
    mac => $mac,
  }
  class { '::secure_linux_cis::distribution::redhat7::cis_1_6_1_3':
    mac => $mac,
  }
  include ::secure_linux_cis::distribution::redhat7::cis_1_6_1_3
  # Debian 1.6.1.4
  include ::secure_linux_cis::distribution::redhat7::cis_1_6_1_6

  include ::secure_linux_cis::distribution::debian9::cis_1_6_2_1
  include ::secure_linux_cis::distribution::debian9::cis_1_6_2_2
  include ::secure_linux_cis::distribution::debian9::cis_1_6_3

  include ::secure_linux_cis::distribution::redhat7::cis_1_7_1_1
  # include ::secure_linux_cis::distribution::redhat7::cis_1_7_1_2
  # include ::secure_linux_cis::distribution::redhat7::cis_1_7_1_3

  # 1.7.1.4
  class { '::secure_linux_cis::distribution::redhat7::cis_1_7_1_4':
    banner => $banner,
    motd   => $motd,
  }

  # 1.7.1.5
  class { '::secure_linux_cis::distribution::redhat7::cis_1_7_1_5':
    banner => $banner,
  }

  # 1.7.1.6
  class { '::secure_linux_cis::distribution::redhat7::cis_1_7_1_6':
    banner => $banner,
  }

  include ::secure_linux_cis::distribution::redhat7::cis_1_7_2

  include ::secure_linux_cis::distribution::redhat7::cis_1_8

  include ::secure_linux_cis::distribution::debian9::cis_2_1_1
  include ::secure_linux_cis::distribution::debian9::cis_2_1_2

  # include ::secure_linux_cis::distribution::redhat7::cis_2_2_1_1
  class { '::secure_linux_cis::distribution::redhat7::cis_2_2_1_2':
    time_servers => $time_servers,
    time_sync    => $time_sync,
  }

  class { '::secure_linux_cis::distribution::redhat7::cis_2_2_1_3':
    time_servers => $time_servers,
    time_sync    => $time_sync,
  }

  include ::secure_linux_cis::distribution::redhat7::cis_2_2_2
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_3
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_4
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_5
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_6
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_7
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_8
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_9
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_10
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_11
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_12
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_13
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_14

  class { '::secure_linux_cis::distribution::redhat7::cis_2_2_15':
    mta => $mta,
  }

  # Debian 2.2.17
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_16
  # Debian 2.2.16
  include ::secure_linux_cis::distribution::redhat7::cis_2_2_21

  include ::secure_linux_cis::distribution::redhat7::cis_2_3_1
  include ::secure_linux_cis::distribution::redhat7::cis_2_3_2
  include ::secure_linux_cis::distribution::redhat7::cis_2_3_3
  include ::secure_linux_cis::distribution::redhat7::cis_2_3_4
  include ::secure_linux_cis::distribution::redhat7::cis_2_3_5

  include ::secure_linux_cis::distribution::redhat7::cis_3_1_1
  include ::secure_linux_cis::distribution::redhat7::cis_3_1_2

  include ::secure_linux_cis::distribution::redhat7::cis_3_2_1
  include ::secure_linux_cis::distribution::redhat7::cis_3_2_2
  include ::secure_linux_cis::distribution::redhat7::cis_3_2_3
  include ::secure_linux_cis::distribution::redhat7::cis_3_2_4
  include ::secure_linux_cis::distribution::redhat7::cis_3_2_5
  include ::secure_linux_cis::distribution::redhat7::cis_3_2_6
  include ::secure_linux_cis::distribution::redhat7::cis_3_2_7
  include ::secure_linux_cis::distribution::redhat7::cis_3_2_8

  # Debian 3.2.9
  class { '::secure_linux_cis::distribution::redhat7::cis_3_3_1':
    ipv6_enabled => $ipv6_enabled,
  }

  # Debian 3.7
  class { '::secure_linux_cis::distribution::redhat7::cis_3_3_3':
    ipv6_enabled => $ipv6_enabled,
  }

  # Debian 3.3.1
  include ::secure_linux_cis::distribution::redhat7::cis_3_4_1
  # Debian 3.3.2
  include ::secure_linux_cis::distribution::redhat7::cis_3_4_2
  # Debian 3.3.3
  include ::secure_linux_cis::distribution::redhat7::cis_3_4_3

  # Debian 3.4.1
  # include ::secure_linux_cis::distribution::redhat7::cis_3_5_1
  # Debian 3.4.2
  # include ::secure_linux_cis::distribution::redhat7::cis_3_5_2
  # Debian 3.4.3
  # include ::secure_linux_cis::distribution::redhat7::cis_3_5_3
  # Debian 3.4.4
  # include ::secure_linux_cis::distribution::redhat7::cis_3_5_4

  # Debian 3.5.3
  include ::secure_linux_cis::distribution::redhat7::cis_3_6_1
  # Debian 3.5.1.1 and 3.5.2.1
  include ::secure_linux_cis::distribution::redhat7::cis_3_6_2
  # Debian 3.5.1.2
  include ::secure_linux_cis::distribution::redhat7::cis_3_6_3
  # Debian 3.5.1.3
  include ::secure_linux_cis::distribution::redhat7::cis_3_6_4
  # Debian 3.5.1.4
  include ::secure_linux_cis::distribution::redhat7::cis_3_6_5

  # Set order for firewall rules to be applied
  Class['::secure_linux_cis::distribution::redhat7::cis_3_6_1']
  -> Class['::secure_linux_cis::distribution::redhat7::cis_3_6_3']
  -> Class['::secure_linux_cis::distribution::redhat7::cis_3_6_4']
  -> Class['::secure_linux_cis::distribution::redhat7::cis_3_6_5']
  -> Class['::secure_linux_cis::distribution::redhat7::cis_3_6_2']

  include ::secure_linux_cis::distribution::debian9::cis_3_5_2_2

  # include ::secure_linux_cis::distribution::redhat7::cis_3_7

  # class { '::secure_linux_cis::distribution::redhat7::cis_4_1_1_1':
  #   max_log_file => $max_log_file,
  # }

  include ::secure_linux_cis::distribution::redhat7::cis_4_1_1_2
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_1_3
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_2
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_3
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_4
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_5
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_6
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_7
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_8
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_9
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_10
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_11
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_12
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_13
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_14
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_15
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_16
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_17
  include ::secure_linux_cis::distribution::redhat7::cis_4_1_18

  class { '::secure_linux_cis::distribution::redhat7::cis_4_2_1_1':
    logging => $logging,
  }

  # class { '::secure_linux_cis::distribution::redhat7::cis_4_2_1_2':
  #   logging => $logging,
  # }

  class { '::secure_linux_cis::distribution::redhat7::cis_4_2_1_3':
    logging => $logging,
  }

  class { '::secure_linux_cis::distribution::redhat7::cis_4_2_1_4':
    logging      => $logging,
    logging_host => $logging_host,
  }

  # class { '::secure_linux_cis::distribution::redhat7::cis_4_2_1_5':
  #   logging         => $logging,
  #   is_logging_host => $is_logging_host,
  # }

  class { '::secure_linux_cis::distribution::redhat7::cis_4_2_2_1':
    logging => $logging,
  }

  # class { '::secure_linux_cis::distribution::redhat7::cis_4_2_2_2':
  #   logging => $logging,
  # }

  class { '::secure_linux_cis::distribution::redhat7::cis_4_2_2_3':
    logging => $logging,
  }

  # class { '::secure_linux_cis::distribution::redhat7::cis_4_2_2_4':
  #   logging      => $logging,
  #   logging_host => $logging_host,
  # }

  # class { '::secure_linux_cis::distribution::redhat7::cis_4_2_2_5':
  #   logging         => $logging,
  #   is_logging_host => $is_logging_host,
  # }

  class { '::secure_linux_cis::distribution::redhat7::cis_4_2_3':
    logging => $logging,
  }

  class { '::secure_linux_cis::distribution::redhat7::cis_4_2_4': }

  # include ::secure_linux_cis::distribution::redhat7::cis_4_3

  include ::secure_linux_cis::distribution::redhat7::cis_5_1_1
  include ::secure_linux_cis::distribution::redhat7::cis_5_1_2
  include ::secure_linux_cis::distribution::redhat7::cis_5_1_3
  include ::secure_linux_cis::distribution::redhat7::cis_5_1_4
  include ::secure_linux_cis::distribution::redhat7::cis_5_1_5
  include ::secure_linux_cis::distribution::redhat7::cis_5_1_6
  include ::secure_linux_cis::distribution::redhat7::cis_5_1_7
  include ::secure_linux_cis::distribution::redhat7::cis_5_1_8
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_1
  # Debian 5.2.4
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_2
  # Debian 5.2.5
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_3
  # Debian 5.2.6
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_4

  # Debian 5.2.7
  class { '::secure_linux_cis::distribution::redhat7::cis_5_2_5':
    max_auth_tries => $max_auth_tries,
  }

  # Debian 5.2.7
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_6
  # Debian 5.2.9
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_7
  # Debian 5.2.10
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_8
  # Debian 5.2.11
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_9
  # Debian 5.2.12
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_10

  # Debian 5.2.14
  class { '::secure_linux_cis::distribution::redhat7::cis_5_2_11':
    approved_mac_algorithms => $approved_mac_algorithms,
  }

  # Debian 5.2.16
  class { '::secure_linux_cis::distribution::redhat7::cis_5_2_12':
    client_alive_interval  => $client_alive_interval,
    client_alive_count_max => $client_alive_count_max,
  }

  # Debian 5.2.17
  class { '::secure_linux_cis::distribution::redhat7::cis_5_2_13':
    login_grace_time => $login_grace_time,
  }

  # Debian 5.2.18
  # need to discuss class 5_2_14 spec testing, fails with empty lists
  class { '::secure_linux_cis::distribution::redhat7::cis_5_2_14':
    allow_users  => $allow_users,
    allow_groups => $allow_groups,
    deny_users   => $deny_users,
    deny_groups  => $deny_groups,
  }

  # Debian 5.2.19
  include ::secure_linux_cis::distribution::redhat7::cis_5_2_15
  include ::secure_linux_cis::distribution::debian9::cis_5_2_2
  include ::secure_linux_cis::distribution::debian9::cis_5_2_3
  include ::secure_linux_cis::distribution::debian9::cis_5_2_13
  include ::secure_linux_cis::distribution::debian9::cis_5_2_15

  class { '::secure_linux_cis::distribution::redhat7::cis_5_3_1':
    minlen  => $minlen,
    dcredit => $dcredit,
    ucredit => $ucredit,
    ocredit => $ocredit,
    lcredit => $lcredit,
  }

  class { '::secure_linux_cis::distribution::redhat7::cis_5_3_2':
    attempts     => $attempts,
    lockout_time => $lockout_time,
  }

  class { '::secure_linux_cis::distribution::redhat7::cis_5_3_3':
    past_passwords => $past_passwords,
  }

  include ::secure_linux_cis::distribution::redhat7::cis_5_3_4

  class { '::secure_linux_cis::distribution::redhat7::cis_5_4_1_1':
    pass_max_days => $pass_max_days,
  }

  class { '::secure_linux_cis::distribution::redhat7::cis_5_4_1_2':
    pass_min_days => $pass_min_days,
  }

  class { '::secure_linux_cis::distribution::redhat7::cis_5_4_1_3':
    pass_warn_days => $pass_warn_days,
  }

  include ::secure_linux_cis::distribution::redhat7::cis_5_4_1_4
  include ::secure_linux_cis::distribution::redhat7::cis_5_4_1_5
  include ::secure_linux_cis::distribution::redhat7::cis_5_4_2
  include ::secure_linux_cis::distribution::redhat7::cis_5_4_3
  include ::secure_linux_cis::distribution::redhat7::cis_5_4_4
  include ::secure_linux_cis::distribution::redhat7::cis_5_4_5
  # include ::secure_linux_cis::distribution::redhat7::cis_5_5
  include ::secure_linux_cis::distribution::redhat7::cis_5_6


  # include ::secure_linux_cis::distribution::redhat7::cis_6_1_1
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_2
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_3
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_4
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_5
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_6
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_7
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_8
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_9
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_10
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_11
  include ::secure_linux_cis::distribution::redhat7::cis_6_1_12
  # include ::secure_linux_cis::distribution::redhat7::cis_6_1_13
  # include ::secure_linux_cis::distribution::redhat7::cis_6_1_14
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_1
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_2
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_3
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_4
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_5
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_6

  file { '/usr/share/cis_scripts':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  include ::secure_linux_cis::distribution::redhat7::cis_6_2_7
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_8
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_9
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_10
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_11
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_12
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_13
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_14
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_15
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_16
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_17
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_18
  include ::secure_linux_cis::distribution::redhat7::cis_6_2_19
  include ::secure_linux_cis::distribution::debian9::cis_6_2_20

  # define classes that change resources requiring a reboot to take effect, as using pkill is undesirable.
  if $auto_restart {
    $restart_classes = [
      'Class[secure_linux_cis::distribution::redhat7::Cis_1_6_1_1]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_3]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_4]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_5]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_6]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_7]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_8]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_9]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_10]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_11]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_13]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_14]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_15]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_16]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_17]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_1_18]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_2_1_3]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_2_1_4]',
      'Class[secure_linux_cis::distribution::redhat7::Cis_4_2_2_3]',
    ]

    reboot { 'after_run':
      apply     => 'finished',
      timeout   => 60,
      subscribe => $restart_classes,
    }
  }
}
