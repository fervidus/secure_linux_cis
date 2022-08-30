# @api private
#  Ensure TIPC is disabled (Not Scored)
#
# # Description:
# The Transparent Inter-Process Communication (TIPC) protocol is designed to provide
# communication between cluster nodes.
#
# Rationale:
# If the protocol is not being used, it is recommended that kernel module not be loaded,
# disabling the service to reduce the potential attack surface.
#
# @summary  Ensure TIPC is disabled (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_tipc_is_disabled
class secure_linux_cis::rules::ensure_tipc_is_disabled {
  realize File['/etc/modprobe.d/storage_disable.conf']

  file_line { 'Disable tipc':
    ensure  => present,
    path    => '/etc/modprobe.d/storage_disable.conf',
    line    => 'install tipc /bin/true',
    match   => '^install\s+tipc',
    require => File['/etc/modprobe.d/storage_disable.conf'],
  }

  exec { '/usr/sbin/rmmod tipc':
    subscribe   => File_line['Disable tipc'],
    refreshonly => true,
  }
}
