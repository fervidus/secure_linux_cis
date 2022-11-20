# @api private
#  Ensure mounting of udf filesystems is disabled (Scored)
#
# Description:
# The udf filesystem type is the universal disk format used to implement ISO/IEC 13346 and ECMA-167 specifications.
# This is an open vendor filesystem type for data storage on a broad range of media.
# This filesystem type is necessary to support writing DVDs and newer optical disc formats.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of udf filesystems is disabled (Scored)
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
