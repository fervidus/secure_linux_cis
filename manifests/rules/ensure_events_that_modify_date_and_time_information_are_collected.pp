# @api private
#
# @summary Ensure events that modify date and time information are collected 
#
class secure_linux_cis::rules::ensure_events_that_modify_date_and_time_information_are_collected {
  Class['secure_linux_cis::rules::ensure_events_that_modify_date_and_time_information_are_collected']
  ~> Class['secure_linux_cis::reboot']
  # 64 bit architecture
  if $facts['os']['architecture'] =~ /64/ {
    file_line { 'audit.rules time 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change',
    }
    file_line { 'audit.rules time 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change',
    }
    file_line { 'audit.rules time 3':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S clock_settime -k time-change',
    }
    file_line { 'audit.rules time 4':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S clock_settime -k time-change',
    }
    file_line { 'audit.rules time 5':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /etc/localtime -p wa -k time-change',
    }
  }
  # 32 bit architecture
  else {
    file_line { 'audit.rules time 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change',
    }
    file_line { 'audit.rules time 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S clock_settime -k time-change',
    }
    file_line { 'audit.rules time 3':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /etc/localtime -p wa -k time-change',
    }
  }
}
