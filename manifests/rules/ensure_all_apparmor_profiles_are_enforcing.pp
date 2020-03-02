# @param enforced Should this rule be enforced
# @api private
# @example
#   include secure_linux_cis::ensure_all_apparmor_profiles_are_enforcing
class secure_linux_cis::rules::ensure_all_apparmor_profiles_are_enforcing(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['apparmor'].empty {
      notify {'apparmor':
        message  => 'Not in compliance with CIS 1.6.2.2 (Scored). See the output of apparmor_status. Make sure all profiles are enforced."',
        schedule => 'harden_schedule',
      }
    }
  }
}
