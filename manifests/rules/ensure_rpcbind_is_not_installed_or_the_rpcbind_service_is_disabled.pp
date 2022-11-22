# @api private
#
# @summary Ensure rpcbind is not installed or the rpcbind service is disabled 
#
class secure_linux_cis::rules::ensure_rpcbind_is_not_installed_or_the_rpcbind_service_is_disabled {
  package { 'rpcbind':
    ensure => absent,
  }
}
