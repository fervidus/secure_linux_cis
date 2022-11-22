# @api private
#
# @summary Ensure iptables packages are installed 
#
class secure_linux_cis::rules::ensure_iptables_packages_are_installed {
  package { ['iptables', 'iptables-services']:
    ensure => installed,
  }
}
