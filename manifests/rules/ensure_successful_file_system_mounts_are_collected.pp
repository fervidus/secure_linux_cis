# @api private
#
# @summary Ensure successful file system mounts are collected 
#
class secure_linux_cis::rules::ensure_successful_file_system_mounts_are_collected {
  Class['secure_linux_cis::rules::ensure_successful_file_system_mounts_are_collected']
  ~> Class['secure_linux_cis::reboot']
  # 64 bit architecture
  if $facts['os']['architecture'] =~ /64/ {
    file_line { 'audit.rules mounts 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
    }
    file_line { 'audit.rules mounts 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
    }
  }
  else {
    file_line { 'audit.rules mounts 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
    }
  }
}
