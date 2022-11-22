# @api private
#
# @summary Ensure nftables service is enabled 
#
class secure_linux_cis::rules::ensure_nftables_service_is_enabled {
  # Handled in nftables module
  # service { 'nftables':
  #   ensure => running,
  #   enable => true,
  # }
}
