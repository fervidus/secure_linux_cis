# 2.2.1.3 Ensure chrony is configured (Scored)
#
# Description:
# chrony is a daemon which implements the Network Time Protocol (NTP) is designed to
# synchronize system clocks across a variety of systems and use a source that is highly
# accurate. More information on chrony can be found at http://chrony.tuxfamily.org/. chrony
# can be configured to be a client and/or a server.
#
# Rationale:
# If chrony is in use on the system proper configuration is vital to ensuring time
# synchronization is working properly.
# This recommendation only applies if chrony is in use on the system.
#
# @summary 2.2.1.3 Ensure chrony is configured (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_1_3
class secure_linux_cis::redhat7::cis_2_2_1_3 (
  Array[String] $time_servers              = [],
  Boolean $enforced                        = true,
  Enum['ntp', 'chrony', 'none'] $time_sync = 'ntp',
) {

  if $enforced and $time_sync == 'chrony' {

    class { '::chrony':
      servers => $time_servers,
    }

    file { '/etc/sysconfig/chronyd':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => 'OPTIONS="-u chrony"',
    }
  }
}
