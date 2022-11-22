# @api private
#
# @summary Ensure mounting of hfs filesystems is disabled 
#
class secure_linux_cis::rules::ensure_mounting_of_hfs_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable hfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install hfs /bin/false',
    match   => '^install\s+hfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist hfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist hfs',
    match   => '^blacklist\s+hfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r hfs':
    subscribe   => [File_line['Disable hfs'], File_line['Blacklist hfs']],
    refreshonly => true,
  }
}
