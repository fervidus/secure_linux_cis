# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_iptables_package_is_installed
class secure_linux_cis::rules::ensure_iptables_package_is_installed {
  package { 'iptables':
    ensure => installed,
  }
}
