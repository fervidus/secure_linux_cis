# @api private
# 4 Ensure file deletion events by users are collected (Scored)
#
# Description:
# Monitor the use of system calls associated with the deletion or renaming of files and file
# attributes. This configuration statement sets up monitoring for the unlink (remove a file),
# unlinkat (remove a file attribute), rename (rename a file) and renameat (rename a file
# attribute) system calls and tags them with the identifier "delete".
#
# Rationale:
# Monitoring these calls from non-privileged users could provide a system administrator
# with evidence that inappropriate removal of files and file attributes associated with
# protected files is occurring. While this audit option will look at all events, system
# administrators will want to look for specific privileged files that are being deleted or
# altered.
#
# @summary 4 Ensure file deletion events by users are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_file_deletion_events_by_users_are_collected
class secure_linux_cis::rules::ensure_file_deletion_events_by_users_are_collected(
    Boolean $enforced = true,
) {

  Class['::secure_linux_cis::rules::ensure_file_deletion_events_by_users_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    # 64 bit architecture
    if $facts['os']['architecture'] =~ /64/ {
      file_line { 'audit.rules file deletion 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
      }
      file_line { 'audit.rules file deletion 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
      }
    }
    # 32 bit architecture
    else {
      file_line { 'audit.rules file deletion 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
      }
    }
  }
}
