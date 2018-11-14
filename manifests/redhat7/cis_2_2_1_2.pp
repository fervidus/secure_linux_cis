# 2.2.1.2 Ensure ntp is configured (Scored)
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
# @summary 2.2.1.2 Ensure ntp is configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_1_2
class secure_linux_cis::redhat7::cis_2_2_1_2 (
  Array[String] $time_servers              = [],
  Boolean $enforced                        = true,
  Enum['ntp', 'chrony', 'none'] $time_sync = 'ntp',
) {

  if $enforced and $time_sync == 'ntp' {

    class { '::ntp':
      servers  => $time_servers,
      restrict => [
        '-4 default kod nomodify notrap nopeer noquery',
        '-6 default kod nomodify notrap nopeer noquery',
      ],
    }

    file { '/etc/sysconfig/ntpd':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => 'OPTIONS="-u ntp:ntp"',
    }

  }

}
