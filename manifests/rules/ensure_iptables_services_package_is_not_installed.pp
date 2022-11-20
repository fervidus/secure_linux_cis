# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_iptables_services_package_is_not_installed {
  service { ['iptables', 'ip6tables']:
    ensure => stopped,
  }

  package { 'iptables-services':
    ensure => absent,
  }
}
