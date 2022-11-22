# @api private
#
# @summary Ensure ufw is uninstalled or disabled with nftables 
#
class secure_linux_cis::rules::ensure_ufw_is_uninstalled_or_disabled_with_nftables {
  package { 'ufw':
    ensure => absent,
  }
}
