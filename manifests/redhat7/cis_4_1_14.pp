# 4.1.14 Ensure file deletion events by users are collected (Scored)
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
# @summary 4.1.14 Ensure file deletion events by users are collected (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_14
class secure_linux_cis::redhat7::cis_4_1_14 (
  Boolean $enforced = true,
) {

  if $enforced {

    # 64 bit architecture
    if $facts['architecture'] =~ /64/ {

      file_line { 'audit.rules file deletion 1':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
      }

      file_line { 'audit.rules file deletion 2':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
      }
    }

    # 32 bit architecture
    else {

      file_line { 'audit.rules file deletion 1':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
      }
    }
  }
}
