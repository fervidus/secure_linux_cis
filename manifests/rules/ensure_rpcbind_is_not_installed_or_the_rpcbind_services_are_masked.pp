# @api private
#
# @summary Ensure rpcbind is not installed or the rpcbind services are masked 
#
class secure_linux_cis::rules::ensure_rpcbind_is_not_installed_or_the_rpcbind_services_are_masked {
  package { 'rpcbind':
    ensure => absent,
  }
}
