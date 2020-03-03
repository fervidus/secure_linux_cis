# @api private
# 1 Ensure unsuccessful unauthorized file access attempts are collected (Scored)
#
# Description:
# Monitor for unsuccessful attempts to access files. The parameters below are associated
# with system calls that control creation ( creat ), opening ( open , openat ) and truncation (
# truncate , ftruncate ) of files. An audit log record will only be written if the user is a nonprivileged
# user (auid > = 1000), is not a Daemon event (auid=4294967295) and if the
# system call returned EACCES (permission denied to the file) or EPERM (some other
# permanent error associated with the specific system call). All audit records will be tagged
# with the identifier "access."
#
# Rationale:
# Failed attempts to open, create or truncate files could be an indication that an individual or
# process is trying to gain unauthorized access to the system.
#
# @summary 1 Ensure unsuccessful unauthorized file access attempts are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected
class secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    # 64 bit architecture
    if $facts['os']['architecture'] =~ /64/ {
      file_line { 'audit.rules file access 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
      }
      file_line { 'audit.rules file access 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
      }
      file_line { 'audit.rules file access 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
      }
      file_line { 'audit.rules file access 4':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
      }
    }
    # 32 bit architecture
    else {
      file_line { 'audit.rules file access 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
      }
      file_line { 'audit.rules file access 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access', # lint:ignore:140chars
      }
    }
  }
}
