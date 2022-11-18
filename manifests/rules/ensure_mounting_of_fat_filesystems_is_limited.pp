# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_mounting_of_fat_filesystems_is_limited
class secure_linux_cis::rules::ensure_mounting_of_fat_filesystems_is_limited {
  $system_audit_rules = @(SYSTEMAUDITRULES/L)
    install fat /bin/true
    install vfat /bin/true
    install msdos /bin/true
    | SYSTEMAUDITRULES

  file { '/etc/modprobe.d/fat.conf':
    ensure  => file,
    content => $system_audit_rules,
  }

  File['/etc/modprobe.d/fat.conf']
  ~> exec { 'msdos reload':
    refreshonly => true,
    command     => 'modprobe -r msdos',
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }

  File['/etc/modprobe.d/fat.conf']
  ~> exec { 'vfat reload':
    refreshonly => true,
    command     => 'modprobe -r vfat',
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }

  File['/etc/modprobe.d/fat.conf']
  ~> exec { 'fat reload':
    refreshonly => true,
    command     => 'modprobe -r fat',
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
