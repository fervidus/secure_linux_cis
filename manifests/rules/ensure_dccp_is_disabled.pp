# @api private
#
# @summary Ensure DCCP is disabled 
#
class secure_linux_cis::rules::ensure_dccp_is_disabled {
  realize File['/etc/modprobe.d/storage_disable.conf']

  file_line { 'Disable dccp':
    ensure  => present,
    path    => '/etc/modprobe.d/storage_disable.conf',
    line    => 'install usb-storage /bin/true',
    match   => '^install\s+usb-storage',
    require => File['/etc/modprobe.d/storage_disable.conf'],
  }
}
