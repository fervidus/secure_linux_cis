# @api private
#
# @summary Ensure nftables is not installed or stopped and masked 
#
class secure_linux_cis::rules::ensure_nftables_is_not_installed_or_stopped_and_masked {
  package { 'nftables':
    ensure => absent,
  }
}
