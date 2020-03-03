# @api private
# 0 Ensure discretionary access control permission modification events are collected (Scored)
#
# Description:
# Monitor changes to file permissions, attributes, ownership and group. The parameters in
# this section track changes for system calls that affect file permissions and attributes. The
# chmod , fchmod and fchmodat system calls affect the permissions associated with a file. The
# chown , fchown , fchownat and lchown system calls affect owner and group attributes on a
# file. The setxattr , lsetxattr , fsetxattr (set extended file attributes) and removexattr ,
# lremovexattr , fremovexattr (remove extended file attributes) control extended file
# attributes. In all cases, an audit record will only be written for non-system user ids (auid >=
# 1000) and will ignore Daemon events (auid = 4294967295). All audit records will be
# tagged with the identifier "perm_mod."
#
# Rationale:
# Monitoring for changes in file attributes could alert a system administrator to activity that
# could indicate intruder activity or policy violation.
#
# @summary 0 Ensure discretionary access control permission modification events are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_discretionary_access_control_permission_modification_events_are_collected
class secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_discretionary_access_control_permission_modification_events_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    # 64 bit architecture
    if $facts['os']['architecture'] =~ /64/ {
      file_line { 'audit.rules access 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
      }

      file_line { 'audit.rules access 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
      }

      file_line { 'audit.rules access 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
      }

      file_line { 'audit.rules access 4':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
      }

      file_line { 'audit.rules access 5':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod', # lint:ignore:140chars
      }

      file_line { 'audit.rules access 6':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod', # lint:ignore:140chars
      }
    }
    # 32 bit architecture
    else {
      file_line { 'audit.rules access 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
      }

      file_line { 'audit.rules access 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
      }
      file_line { 'audit.rules access 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod', # lint:ignore:140chars
      }
    }
  }
}
