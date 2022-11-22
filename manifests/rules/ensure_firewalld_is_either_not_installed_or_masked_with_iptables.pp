# @api private
#
# @summary Ensure firewalld is either not installed or masked with iptables 
#
class secure_linux_cis::rules::ensure_firewalld_is_either_not_installed_or_masked_with_iptables {
  package { 'firewalld':
    ensure => absent,
  }
}
