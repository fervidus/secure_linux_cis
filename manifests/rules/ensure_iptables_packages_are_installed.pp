# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_iptables_packages_are_installed
class secure_linux_cis::rules::ensure_iptables_packages_are_installed {
  package { ['iptables', 'iptables-services']:
    ensure => installed,
  }
}
