# @api private
#
# @summary Ensure RPC is not installed 
#
class secure_linux_cis::rules::ensure_rpc_is_not_installed {
  package { 'rpcbind':
    ensure => absent,
  }
}
