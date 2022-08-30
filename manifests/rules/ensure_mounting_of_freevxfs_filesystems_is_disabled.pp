# @api private
#  Ensure mounting of freevxfs filesystems is disabled (Scored)
#
# Description:
# The freevxfs filesystem type is a free version of the Veritas type filesystem.
# This is the primary filesystem type for HP-UX operating systems.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of freevxfs filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_freevxfs_filesystems_is_disabled
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
