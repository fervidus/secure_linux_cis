# @api private
#
# @summary Ensure all AppArmor Profiles are enforcing 
#
class secure_linux_cis::rules::ensure_all_apparmor_profiles_are_enforcing {
  unless $facts['apparmor'].empty {
    notify { 'apparmor':
      message  => 'Not in compliance with CIS 1.6.2.2 (Scored). See the output of apparmor_status. Make sure all profiles are enforced."',
    }
  }
}
