# @api private
#
# @summary Ensure unsuccessful unauthorized file access attempts are collected 
#
class secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected {
  Class['secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected']
  ~> Class['secure_linux_cis::reboot']
  # 64 bit architecture
  if $facts['os']['architecture'] =~ /64/ {
    file_line { 'audit.rules file access 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
    }
    file_line { 'audit.rules file access 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
    }
    file_line { 'audit.rules file access 3':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
    }
    file_line { 'audit.rules file access 4':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
    }
  }
  # 32 bit architecture
  else {
    file_line { 'audit.rules file access 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
    }
    file_line { 'audit.rules file access 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
    }
  }
}
