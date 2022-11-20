# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_iptables_package_is_installed {
  package { 'iptables':
    ensure => installed,
  }
}
