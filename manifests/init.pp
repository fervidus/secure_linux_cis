# @summary CIS Red Hat Enterprise Linux 7 Benchmark
#
# @param time_servers Array of valid NTP Time servers
# @param logging How logging is done
# @param logging_host Which host should logging be sent to
# @param is_logging_host Is this host a logging host
# @param max_log_file Maximum log file
# @param max_auth_tries How many authorization attempts to allow
# @param time_sync Which NTP program to use
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
# @param repolist List of acceptable software repos
#
# @example
#   include secure_linux_cis
class secure_linux_cis (
  Array[String] $time_servers = [],
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  String $logging_host = '',  #lint:ignore:empty_string_assignment
  Boolean $is_logging_host = false,
  Integer $max_log_file = 8,
  Enum['1', '2', '3', '4'] $max_auth_tries = '4',
  Enum['ntp', 'chrony', 'none'] $time_sync = 'none',
  Boolean $ipv6_enabled = true,
  Array $approved_mac_algorithms = ['hmac-sha2-512-etm@openssh.com','hmac-sha2-256-etm@openssh.com','umac-128-etm@openssh.com',
                                    'hmac-sha2-512','hmac-sha2-256','umac-128@openssh.com'],  #lint:ignore:strict_indent
  # $client_alive_interval must be between 1 and 300
  Integer $client_alive_interval = 300,
  Enum['0','1','2','3'] $client_alive_count_max = '0',
  Integer $login_grace_time = 60,
  Array[String] $allow_users = [],
  Array[String] $allow_groups = [],
  Array[String] $deny_users = [],
  Array[String] $deny_groups =[],
  Integer $minlen = 14,
  Integer $dcredit = -1,
  Integer $ucredit = -1,
  Integer $ocredit = -1,
  Integer $lcredit = -1,
  Integer $attempts = 5,
  Integer $lockout_time = 900,
  Integer $past_passwords = 5,
  Integer $pass_max_days = 90,
  Integer $pass_min_days = 7,
  Integer $pass_warn_days = 7,
  Array   $repolist = ['updates/7/x86_64','rhel-7-server-rpms/7Server/x86_64'],
) {

# Validate parameters





  # Local Variable for full Operating System
  $os = "${facts['os']['name']}${facts['os']['release']['major']}"

  case $os {
    'RedHat7': {
      class { '::secure_linux_cis::redhat7':
        logging                 => $logging,
        logging_host            => $logging_host,
        is_logging_host         => $is_logging_host,
        max_log_file            => $max_log_file,
        max_auth_tries          => $max_auth_tries,
        approved_mac_algorithms => $approved_mac_algorithms,
        time_servers            => $time_servers,
        time_sync               => $time_sync,
        ipv6_enabled            => $ipv6_enabled,
        client_alive_interval   => $client_alive_interval,
        client_alive_count_max  => $client_alive_count_max,
        login_grace_time        => $login_grace_time,
        allow_users             => $allow_users,
        allow_groups            => $allow_groups,
        deny_users              => $deny_users,
        deny_groups             => $deny_groups,
        minlen                  => $minlen,
        dcredit                 => $dcredit,
        ucredit                 => $ucredit,
        ocredit                 => $ocredit,
        lcredit                 => $lcredit,
        attempts                => $attempts,
        lockout_time            => $lockout_time,
        past_passwords          => $past_passwords,
        pass_max_days           => $pass_max_days,
        pass_min_days           => $pass_min_days,
        pass_warn_days          => $pass_warn_days,
      }
    }

    'centos7','CentOS7': {
      class { '::secure_linux_cis::centos7':
        logging                 => $logging,
        logging_host            => $logging_host,
        is_logging_host         => $is_logging_host,
        max_log_file            => $max_log_file,
        max_auth_tries          => $max_auth_tries,
        approved_mac_algorithms => $approved_mac_algorithms,
        time_servers            => $time_servers,
        time_sync               => $time_sync,
        ipv6_enabled            => $ipv6_enabled,
        client_alive_interval   => $client_alive_interval,
        client_alive_count_max  => $client_alive_count_max,
        login_grace_time        => $login_grace_time,
        allow_users             => $allow_users,
        allow_groups            => $allow_groups,
        deny_users              => $deny_users,
        deny_groups             => $deny_groups,
        minlen                  => $minlen,
        dcredit                 => $dcredit,
        ucredit                 => $ucredit,
        ocredit                 => $ocredit,
        lcredit                 => $lcredit,
        attempts                => $attempts,
        lockout_time            => $lockout_time,
        past_passwords          => $past_passwords,
        pass_max_days           => $pass_max_days,
        pass_min_days           => $pass_min_days,
        pass_warn_days          => $pass_warn_days,
      }
    }
    default: {
      fail("Operating System: ${os} is not supported at this time.")
    }

  }

}
