# @api private
#
# @summary Ensure iptables-persistent is not installed with ufw 
#
class secure_linux_cis::rules::ensure_iptables_persistent_is_not_installed_with_ufw {
  package { 'iptables-persistent':
    ensure => absent,
  }
}
