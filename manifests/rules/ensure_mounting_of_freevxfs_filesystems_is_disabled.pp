# @api private
#
# @summary Ensure mounting of freevxfs filesystems is disabled 
#
class secure_linux_cis::rules::ensure_mounting_of_freevxfs_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable freevxfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install freevxfs /bin/false',
    match   => '^install\s+freevxfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist freevxfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist freevxfs',
    match   => '^blacklist\s+freevxfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r freevxfs':
    subscribe   => [File_line['Disable freevxfs'], File_line['Blacklist freevxfs']],
    refreshonly => true,
  }
}
