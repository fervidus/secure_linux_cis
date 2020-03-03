# @api private
#  Ensure events that modify date and time information are collected (Scored)
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
# @summary  Ensure events that modify date and time information are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_events_that_modify_date_and_time_information_are_collected
class secure_linux_cis::rules::ensure_events_that_modify_date_and_time_information_are_collected(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_events_that_modify_date_and_time_information_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    # 64 bit architecture
    if $facts['os']['architecture'] =~ /64/ {
      file_line { 'audit.rules time 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change',
      }
      file_line { 'audit.rules time 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change',
      }
      file_line { 'audit.rules time 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S clock_settime -k time-change',
      }
      file_line { 'audit.rules time 4':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S clock_settime -k time-change',
      }
      file_line { 'audit.rules time 5':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /etc/localtime -p wa -k time-change',
      }
    }
    # 32 bit architecture
    else {
      file_line { 'audit.rules time 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change',
      }
      file_line { 'audit.rules time 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S clock_settime -k time-change',
      }
      file_line { 'audit.rules time 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /etc/localtime -p wa -k time-change',
      }
    }
  }
}
