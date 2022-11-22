# @api private
#
# @summary Ensure ntp is configured 
#
class secure_linux_cis::rules::ensure_ntp_is_configured {
  if $secure_linux_cis::time_sync == 'ntp' {
    class { 'ntp':
      servers  => $secure_linux_cis::time_servers,
      restrict => [
        '-4 default kod nomodify notrap nopeer noquery',
        '-6 default kod nomodify notrap nopeer noquery',
      ],
    }
    case $facts['osfamily'] {
      'RedHat': {
        file { '/etc/sysconfig/ntpd':
          ensure  => file,
          owner   => 'root',
          group   => 'root',
          mode    => '0644',
          content => 'OPTIONS="-u ntp:ntp"',
        }
      }
      'Debian': {
        file_line { 'ntpuser':
          ensure  => present,
          path    => '/etc/init.d/ntp',
          line    => 'RUNASUSER=ntp',
          match   => '^RUNASUSER=',
          require => Class['ntp'],
        }
      }
      default: {
        warning ("NTP configuration is not supported on os family ${facts['osfamily']}.")
      }
    }
  }
}
