# 4.1.9 Ensure session initiation information is collected (Scored)
#
# @summary This class is the entry point for CIS hardening depending on OS.
# Description:
# Monitor session initiation events. The parameters in this section track changes to the files
# associated with session events. The file /var/run/utmp file tracks all currently logged in
# users. All audit records will be tagged with the identifier "session." The /var/log/wtmp file
# tracks logins, logouts, shutdown, and reboot events. The file /var/log/btmp keeps track of
# failed login attempts and can be read by entering the command /usr/bin/last -f
# /var/log/btmp . All audit records will be tagged with the identifier "logins."
#
# Rationale:
# Monitoring these files for changes could alert a system administrator to logins occurring at
# unusual hours, which could indicate intruder activity (i.e. a user logging in at a time when
# they do not normally log in).
#
# @summary 4.1.9 Ensure session initiation information is collected (Scored)
#
# @example
#   include secure_linux_cis
class secure_linux_cis (
  Array[String] $time_servers = [],
  Enum['rsyslog', 'syslog-ng', 'none'] $logging = 'rsyslog',
  String $logging_host = '',
  Boolean $is_logging_host = false,
  Integer $max_log_file = 8,
  Enum['1', '2', '3', '4'] $max_auth_tries = '4',
  Enum['ntp', 'chrony', 'none'] $time_sync = 'ntp',
  Boolean $ipv6_enabled = true,
  Array $approved_mac_algorithms = ['hmac-sha2-512-etm@openssh.com','hmac-sha2-256-etm@openssh.com','umac-128-etm@openssh.com',
                                    'hmac-sha2-512','hmac-sha2-256','umac-128@openssh.com'],
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
) {

# Validate parameters





  # Local Variable for full Operating System
  $os = "${facts['operatingsystem']}${facts['operatingsystemmajrelease']}"

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
    default: {
      fail("Operating System: ${os} is not supported at this time.")
    }
  }

}
