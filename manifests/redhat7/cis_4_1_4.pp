# 4.1.4 Ensure events that modify date and time information are collected (Scored)
#
# Description:
# Capture events where the system date and/or time has been modified. The parameters in
# this section are set to determine if the adjtimex (tune kernel clock), settimeofday (Set
# time, using timeval and timezone structures) stime (using seconds since 1/1/1970) or
# clock_settime (allows for the setting of several internal clocks and timers) system calls
# have been executed and always write an audit record to the /var/log/audit.log file upon
# exit, tagging the records with the identifier "time-change"
#
# Rationale:
# Unexpected changes in system date and/or time could be a sign of malicious activity on the
# system.
#
# @summary 4.1.4 Ensure events that modify date and time information are collected (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_4
class secure_linux_cis::redhat7::cis_4_1_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    # 64 bit architecture
    if $facts['architecture'] =~ /64/ {

      file_line { 'audit.rules time 1':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change',
      }

      file_line { 'audit.rules time 2':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k timechange',
      }

      file_line { 'audit.rules time 3':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b64 -S clock_settime -k time-change',
      }

      file_line { 'audit.rules time 4':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b32 -S clock_settime -k time-change',
      }

      file_line { 'audit.rules time 5':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-w /etc/localtime -p wa -k time-change',
      }

    }

    # 32 bit architecture
    else {

      file_line { 'audit.rules time 1':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k timechange',
      }

      file_line { 'audit.rules time 2':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b32 -S clock_settime -k time-change',
      }

      file_line { 'audit.rules time 3':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-w /etc/localtime -p wa -k time-change',
      }
    }
  }
}
