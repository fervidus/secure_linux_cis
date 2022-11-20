# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_firewalld_is_either_not_installed_or_masked_with_iptables {
  package { 'firewalld':
    ensure => absent,
  }
}
