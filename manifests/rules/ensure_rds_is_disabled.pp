# @api private
#  Ensure RDS is disabled (Not Scored)
#
# Description:
# The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to
# provide low-latency, high-bandwidth communications between cluster nodes. It was
# developed by the Oracle Corporation.
#
# Rationale:
# If the protocol is not being used, it is recommended that kernel module not be loaded,
# disabling the service to reduce the potential attack surface.
#
# @summary  Ensure RDS is disabled (Not Scored)
#
class secure_linux_cis::rules::ensure_rds_is_disabled {
  realize File['/etc/modprobe.d/storage_disable.conf']

  file_line { 'Disable rds':
    ensure  => present,
    path    => '/etc/modprobe.d/storage_disable.conf',
    line    => 'install rds /bin/true',
    match   => '^install\s+rds',
    require => File['/etc/modprobe.d/storage_disable.conf'],
  }

  exec { '/usr/sbin/rmmod rds':
    subscribe   => File_line['Disable rds'],
    refreshonly => true,
  }
}
