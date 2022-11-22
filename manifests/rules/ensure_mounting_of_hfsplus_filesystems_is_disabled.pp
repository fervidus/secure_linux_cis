# @api private
#
# @summary Ensure mounting of hfsplus filesystems is disabled 
#
class secure_linux_cis::rules::ensure_mounting_of_hfsplus_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable hfsplus':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install hfsplus /bin/false',
    match   => '^install\s+hfsplus',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist hfsplus':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist hfsplus',
    match   => '^blacklist\s+hfsplus',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r hfsplus':
    subscribe   => [File_line['Disable hfsplus'], File_line['Blacklist hfsplus']],
    refreshonly => true,
  }
}
