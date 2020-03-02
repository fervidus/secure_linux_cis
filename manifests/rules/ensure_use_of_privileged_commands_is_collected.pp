# @api private
# 2 Ensure use of privileged commands is collected (Scored)
#
# Description:
# Monitor privileged programs (those that have the setuid and/or setgid
# bit set on execution) to determine if unprivileged users are running
# these commands.
#
# Rationale:
# Execution of privileged commands by non-privileged users could be an
# indication of someone trying to gain unauthorized access to the system.
#
# @summary 2 Ensure use of privileged commands is collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_use_of_privileged_commands_is_collected
class secure_linux_cis::rules::ensure_use_of_privileged_commands_is_collected(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/audit_priv.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/audit_priv.sh'),
    }
    unless $facts['audit_privileged'].empty {
      file { '/etc/audit/rules.d/cis_4_1_12.rules':
        ensure   => file,
        schedule => 'harden_schedule',
        owner    => 'root',
        group    => 'root',
        mode     => '0600',
        content  => $facts['audit_privileged']
      }
    }
  }
}
