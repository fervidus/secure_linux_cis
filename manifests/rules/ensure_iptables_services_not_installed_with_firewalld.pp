# @api private
#
# @summary Ensure iptables-services not installed with firewalld   
#
class secure_linux_cis::rules::ensure_iptables_services_not_installed_with_firewalld {
  package { 'firewalld':
    ensure => absent,
  }
}
