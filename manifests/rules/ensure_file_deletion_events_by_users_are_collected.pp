# @api private
#
# @summary Ensure file deletion events by users are collected 
#
class secure_linux_cis::rules::ensure_file_deletion_events_by_users_are_collected {
  Class['secure_linux_cis::rules::ensure_file_deletion_events_by_users_are_collected']
  ~> Class['secure_linux_cis::reboot']
  # 64 bit architecture
  if $facts['os']['architecture'] =~ /64/ {
    file_line { 'audit.rules file deletion 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
    }
    file_line { 'audit.rules file deletion 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
    }
  }
  # 32 bit architecture
  else {
    file_line { 'audit.rules file deletion 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
    }
  }
}
