# @api private
#
# @summary Ensure mounting of squashfs filesystems is disabled 
#
class secure_linux_cis::rules::ensure_mounting_of_squashfs_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable squashfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install squashfs /bin/false',
    match   => '^install\s+squashfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist squashfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist squashfs',
    match   => '^blacklist\s+squashfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r squashfs':
    subscribe   => [File_line['Disable squashfs'], File_line['Blacklist squashfs']],
    refreshonly => true,
  }
}
