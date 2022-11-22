# @api private
#
# @summary Ensure discretionary access control permission modification events are collected 
#
class secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected {
  Class['secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected']
  ~> Class['secure_linux_cis::reboot']
  # 64 bit architecture
  if $facts['os']['architecture'] =~ /64/ {
    file_line { 'audit.rules access 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    }

    file_line { 'audit.rules access 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    }

    file_line { 'audit.rules access 3':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    }

    file_line { 'audit.rules access 4':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    }

    file_line { 'audit.rules access 5':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod', # lint:ignore:140chars
    }

    file_line { 'audit.rules access 6':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod', # lint:ignore:140chars
    }
  }
  # 32 bit architecture
  else {
    file_line { 'audit.rules access 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    }

    file_line { 'audit.rules access 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    }
    file_line { 'audit.rules access 3':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod', # lint:ignore:140chars
    }
  }
}
