# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nftables_is_not_installed_or_stopped_and_masked
class secure_linux_cis::rules::ensure_nftables_is_not_installed_or_stopped_and_masked {
  package { 'nftables':
    ensure => absent,
  }
}
