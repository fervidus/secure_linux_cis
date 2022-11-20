# @api private
#  Ensure mounting of FAT filesystems is disabled (Scored)
#
# Description:
# The FAT filesystem format is primarily used on older windows systems and portable USB drives or flash modules.
# It comes in three types FAT12 , FAT16 , and FAT32 all of which are supported by the vfat kernel module.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of FAT filesystems is disabled (Scored)
#
class secure_linux_cis::rules::ensure_mounting_of_fat_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable vfat':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install vfat /bin/false',
    match   => '^install\s+vfat',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist vfat':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist vfat',
    match   => '^blacklist\s+vfat',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r vfat':
    subscribe   => [File_line['Disable vfat'], File_line['Blacklist vfat']],
    refreshonly => true,
  }
}
