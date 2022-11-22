# @api private
#
# @summary Ensure login and logout events are collected 
#
class secure_linux_cis::rules::ensure_login_and_logout_events_are_collected {
  Class['secure_linux_cis::rules::ensure_login_and_logout_events_are_collected']
  ~> Class['secure_linux_cis::reboot']
  file_line { 'audit.rules login/logout 1':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /var/log/lastlog -p wa -k logins',
  }
  case $facts['os']['family'] {
    'RedHat': {
      if $facts['os']['release']['major'] == '8' {
        file_line { 'audit.rules login/logout 2':
          ensure => present,
          path   => '/etc/audit/rules.d/audit.rules',
          line   => '-w /var/log/faillog -p wa -k logins',
        }
      } else {
        file_line { 'audit.rules login/logout 2':
          ensure => present,
          path   => '/etc/audit/rules.d/audit.rules',
          line   => '-w /var/run/faillock/ -p wa -k logins',
        }
      }
    }
    'Debian': {
      file_line { 'audit.rules login/logout 2':
        ensure => present,
        path   => '/etc/audit/rules.d/audit.rules',
        line   => '-w /var/log/faillog -p wa -k logins',
      }
      file_line { 'audit.rules login/logout 3':
        ensure => present,
        path   => '/etc/audit/rules.d/audit.rules',
        line   => '-w /var/log/tallylog -p wa -k logins',
      }
    }
    default: {
      warning ("Login / logon event checking is not supported on os family ${facts['os']['family']}.")
    }
  }
}
