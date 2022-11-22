# @api private
#
# @summary Ensure RDS is disabled 
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
