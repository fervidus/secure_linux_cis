# @api private
#
# @summary Ensure SCTP is disabled 
#
class secure_linux_cis::rules::ensure_sctp_is_disabled {
  realize File['/etc/modprobe.d/storage_disable.conf']

  file_line { 'Disable sctp':
    ensure  => present,
    path    => '/etc/modprobe.d/storage_disable.conf',
    line    => 'install sctp /bin/true',
    match   => '^install\s+sctp',
    require => File['/etc/modprobe.d/storage_disable.conf'],
  }

  exec { '/usr/sbin/rmmod sctp':
    subscribe   => File_line['Disable sctp'],
    refreshonly => true,
  }
}
