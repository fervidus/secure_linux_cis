# @api private
#
# @summary Ensure dnsmasq is not installed 
#
class secure_linux_cis::rules::ensure_dnsmasq_is_not_installed {
  package { 'dnsmasq':
    ensure => absent,
  }
}
