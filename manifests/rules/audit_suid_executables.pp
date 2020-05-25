# @api private
# 3 Audit SUID executables (Not Scored)
#
#
# Description:
# The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running the
# program is not the owner or a member of the group. The most common reason for a SUID program is to enable users to perform functions
# (such as changing their password) that require root privileges.
#
# @summary 3 Audit SUID executables (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::audit_suid_executables
#
# NOTE: Not feasible for programatic enforcement
#
class secure_linux_cis::rules::audit_suid_executables(
    Boolean $enforced = false,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/audit_suid.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/audit_suid.sh'),
    }
    if $facts['suid_files'] {
      notify { 'sf':
        message  => '[3] (Not Scored) SUID files found. Check the suid_files fact and ensure all files are authorized.', #lint:ignore:140chars
        schedule => 'harden_schedule',
      }
    }
  }
}
