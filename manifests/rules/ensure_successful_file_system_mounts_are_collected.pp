# @api private
# 3 Ensure successful file system mounts are collected (Scored)
#
# Description:
# Monitor the use of the mount system call. The mount (and umount ) system call controls the
# mounting and unmounting of file systems. The parameters below configure the system to
# create an audit record when the mount system call is used by a non-privileged user
#
# Rationale:
# It is highly unusual for a non privileged user to mount file systems to the system. While
# tracking mount commands gives the system administrator evidence that external media
# may have been mounted (based on a review of the source of the mount and confirming it's
# an external media type), it does not conclusively indicate that data was exported to the
# media. System administrators who wish to determine if data were exported, would also
# have to track successful open , creat and truncate system calls requiring write access to a
# file under the mount point of the external media file system. This could give a fair
# indication that a write occurred. The only way to truly prove it, would be to track
# successful writes to the external media. Tracking write system calls could quickly fill up the
# audit log and is not recommended. Recommendations on configuration options to track
# data export to media is beyond the scope of this document.
#
# @summary 3 Ensure successful file system mounts are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_successful_file_system_mounts_are_collected
class secure_linux_cis::rules::ensure_successful_file_system_mounts_are_collected(
    Boolean $enforced = true,
) {

  Class['::secure_linux_cis::rules::ensure_successful_file_system_mounts_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    # 64 bit architecture
    if $facts['os']['architecture'] =~ /64/ {
      file_line { 'audit.rules mounts 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
      }
      file_line { 'audit.rules mounts 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
      }
    }
    else {
      file_line { 'audit.rules mounts 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
      }
    }
  }
}
