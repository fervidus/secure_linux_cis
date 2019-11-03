# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_rpc_is_not_enabled
class secure_linux_cis::rules::ensure_rpc_is_not_enabled {
  service { 'rpcbind':
    ensure => stopped,
    enable => false,
  }
}
