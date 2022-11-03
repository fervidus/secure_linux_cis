# @api private
#
# Description:
# Uncomplicated Firewall (UFW) is a program for managing a netfilter firewall designed to be easy to use.
#
# Rationale:
# Running both the nftables service and ufw may lead to conflict and unexpected results.
#
# @example
#   include secure_linux_cis::ensure_ufw_is_uninstalled_or_disabled_with_nftables
class secure_linux_cis::rules::ensure_ufw_is_uninstalled_or_disabled_with_nftables {
  package { 'ufw':
    ensure => purged,
  }
}
