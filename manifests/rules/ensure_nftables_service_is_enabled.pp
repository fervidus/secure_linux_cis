# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nftables_service_is_enabled
class secure_linux_cis::rules::ensure_nftables_service_is_enabled {
  # Handled in nftables module
  # service { 'nftables':
  #   ensure => running,
  #   enable => true,
  # }
}
