# @api private
#
#  Ensure mounting of hfsplus filesystems is disabled (Scored)
#
# Description:
# The hfsplus filesystem type is a hierarchical filesystem designed to replace hfs that allows you to mount Mac OS filesystems.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of hfsplus filesystems is disabled (Scored)
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
