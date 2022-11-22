# @api private
#
# @summary Ensure TIPC is disabled 
#
class secure_linux_cis::rules::ensure_tipc_is_disabled {
  realize File['/etc/modprobe.d/storage_disable.conf']

  file_line { 'Disable tipc':
    ensure  => present,
    path    => '/etc/modprobe.d/storage_disable.conf',
    line    => 'install tipc /bin/true',
    match   => '^install\s+tipc',
    require => File['/etc/modprobe.d/storage_disable.conf'],
  }
  ~> exec { '/usr/sbin/rmmod tipc':
    refreshonly => true,
  }
}
