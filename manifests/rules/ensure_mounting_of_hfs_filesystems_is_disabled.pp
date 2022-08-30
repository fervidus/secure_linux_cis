# @api private
#  Ensure mounting of hfs filesystems is disabled (Scored)
#
# Description:
# The hfs filesystem type is a hierarchical filesystem that allows you to mount Mac OS filesystems.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of hfs filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_hfs_filesystems_is_disabled
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
