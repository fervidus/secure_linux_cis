# @api private
#  Ensure core dumps are restricted (Scored)
#
#
# Description:
# A core dump is the memory of an executable program. It is generally used to determine why a program aborted. It can
# also be used to glean confidential information from a core file. The system provides the ability to set a soft limit for core dumps,
# but this can be overridden by the user.
#
# @summary  Ensure core dumps are restricted (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_core_dumps_are_restricted
class secure_linux_cis::rules::ensure_core_dumps_are_restricted(
    Boolean $enforced = true,
) {
  if $enforced {
    file_line { 'limits_hc':
      schedule => 'harden_schedule',
      path     => '/etc/security/limits.conf',
      line     => '* hard core 0',
      match    => '^* hard core ',
    }

    sysctl { 'fs.suid_dumpable':
      value    => 0,
      schedule => 'harden_schedule',
    }
  }
}
