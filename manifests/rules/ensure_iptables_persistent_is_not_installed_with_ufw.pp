# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_iptables_persistent_is_not_installed_with_ufw
class secure_linux_cis::rules::ensure_iptables_persistent_is_not_installed_with_ufw {
  package { 'ufw':
    ensure => purged,
  }
}
