# @api private
#  Ensure ntp is configured (Scored)
#
# Description:
# ntp is a daemon which implements the Network Time Protocol (NTP). It is designed to
# synchronize system clocks across a variety of systems and use a source that is highly
# accurate. More information on NTP can be found at http://www.ntp.org. ntp can be
# configured to be a client and/or a server.
# This recommendation only applies if ntp is in use on the system.
#
# Rationale:
# If ntp is in use on the system proper configuration is vital to ensuring time synchronization
# is working properly.
#
# @summary  Ensure ntp is configured (Scored)
#
# @param enforced Should this rule be enforced
# @param time_servers Array of valid NTP Time servers
# @param time_sync Which NTP program to use
#
# @example
#   include secure_linux_cis::ensure_ntp_is_configured
class secure_linux_cis::rules::ensure_ntp_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    if $::secure_linux_cis::time_sync == 'ntp' {
      class { '::ntp':
        servers  => $::secure_linux_cis::time_servers,
        schedule => 'harden_schedule',
        restrict => [
          '-4 default kod nomodify notrap nopeer noquery',
          '-6 default kod nomodify notrap nopeer noquery',
        ],
      }
      case $facts['osfamily'] {
        'RedHat': {
          file { '/etc/sysconfig/ntpd':
            ensure   => file,
            schedule => 'harden_schedule',
            owner    => 'root',
            group    => 'root',
            mode     => '0644',
            content  => 'OPTIONS="-u ntp:ntp"',
          }
        }
        'Debian': {
          file_line { 'ntpuser':
            ensure   => present,
            schedule => 'harden_schedule',
            path     => '/etc/init.d/ntp',
            line     => 'RUNASUSER=ntp',
            match    => '^RUNASUSER=',
            require  => Class['::ntp']
          }
        }
        default: {
          warning ("NTP configuration is not supported on os family ${facts['osfamily']}.")
        }
      }
    }
  }
}
