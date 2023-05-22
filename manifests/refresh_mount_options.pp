# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::refresh_mount_options
class secure_linux_cis::refresh_mount_options {
  exec { 'configure mount options':
    refreshonly => true,
    command     => 'augenrules --load',
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
  if $secure_linux_cis::auto_restart {
    reboot { 'Reboot required to load rules':
      when      => 'refreshed',
      onlyif    => 'test `auditctl -s | grep "enabled"` =~ "2"',
      subscribe => Exec['configure mount options'],
    }
  }
}
