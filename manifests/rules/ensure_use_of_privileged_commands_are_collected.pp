# @api private
#
# @summary Ensure use of privileged commands are collected
#
class secure_linux_cis::rules::ensure_use_of_privileged_commands_are_collected {
  file { 'audit_use_of_privileged_commands_are_collected':
    ensure => file,
    path   => '/root/scripts/audit_use_of_privileged_commands_are_collected.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_use_of_privileged_commands_are_collected.sh',
    mode   => 'u+x',
  }

  file { 'ensure_use_of_privileged_commands_are_collected':
    ensure => file,
    path   => '/root/scripts/ensure_use_of_privileged_commands_are_collected.sh',
    source => 'puppet:///modules/secure_linux_cis/ensure_use_of_privileged_commands_are_collected.sh',
    mode   => 'u+x',
  }

  exec { 'audit privileged commands':
    command  => '/root/scripts/ensure_use_of_privileged_commands_are_collected.sh',
    unless   => '/root/scripts/audit_use_of_privileged_commands_are_collected.sh',
    require  => [
      File['audit_use_of_privileged_commands_are_collected'],
      File['ensure_use_of_privileged_commands_are_collected']
    ],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }

  Class['secure_linux_cis::rules::ensure_use_of_privileged_commands_are_collected']
  ~> Class['secure_linux_cis::refresh_mount_options']
}
