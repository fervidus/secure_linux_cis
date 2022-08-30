# @api private
#  Ensure mounting of cramfs filesystems is disabled (Scored)
#
# Description:
# The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems.
# A cramfs image can be used without having to first decompress the image.
#
# Rationale:
# Removing support for unneeded filesystem types reduces the local attack surface of the server.
# If this filesystem type is not needed, disable it.
#
# @summary  Ensure mounting of cramfs filesystems is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_mounting_of_cramfs_filesystems_is_disabled
class secure_linux_cis::rules::ensure_mounting_of_cramfs_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable cramfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install cramfs /bin/false',
    match   => '^install\s+cramfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist cramfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist cramfs',
    match   => '^blacklist\s+cramfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r cramfs':
    subscribe   => [File_line['Disable cramfs'], File_line['Blacklist cramfs']],
    refreshonly => true,
  }
}
