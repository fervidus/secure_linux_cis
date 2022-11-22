# @api private
#
# @summary Ensure AppArmor is installed 
#
class secure_linux_cis::rules::ensure_apparmor_is_installed {
  package { ['apparmor', 'apparmor-utils']:
    ensure   => installed,
  }
}
