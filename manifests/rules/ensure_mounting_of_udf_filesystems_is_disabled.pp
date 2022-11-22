# @api private
#
# @summary Ensure mounting of udf filesystems is disabled 
#
class secure_linux_cis::rules::ensure_mounting_of_udf_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable udf':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install udf /bin/false',
    match   => '^install\s+udf',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist udf':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist udf',
    match   => '^blacklist\s+udf',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r udf':
    subscribe   => [File_line['Disable udf'], File_line['Blacklist udf']],
    refreshonly => true,
  }
}
