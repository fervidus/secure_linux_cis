# @api private
#
# @summary Disable USB Storage 
#
class secure_linux_cis::rules::disable_usb_storage {
  realize File['/etc/modprobe.d/storage_disable.conf']

  file_line { 'Disable usb_storage':
    ensure  => present,
    path    => '/etc/modprobe.d/storage_disable.conf',
    line    => 'install usb-storage /bin/true',
    match   => '^install\s+usb-storage',
    require => File['/etc/modprobe.d/storage_disable.conf'],
  }

  exec { '/usr/sbin/rmmod usb-storage':
    subscribe   => File_line['Disable usb_storage'],
    refreshonly => true,
    returns     => [0, 1],
  }
}
