# @api private
#  Ensure mounting of jffs2 filesystems is disabled (Scored)
#
# Description:
# The jffs2 (journaling flash filesystem 2) filesystem type is a log-structured filesystem used in flash memory devices.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the system.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of jffs2 filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_jffs2_filesystems_is_disabled
class secure_linux_cis::rules::ensure_mounting_of_jffs2_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable jffs2':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install jffs2 /bin/false',
    match   => '^install\s+jffs2',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist jffs2':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist jffs2',
    match   => '^blacklist\s+jffs2',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r jffs2':
    subscribe   => [File_line['Disable jffs2'], File_line['Blacklist jffs2']],
    refreshonly => true,
  }
}
