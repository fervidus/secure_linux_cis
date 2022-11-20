# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_rpc_is_not_installed {
  package { 'rpcbind':
    ensure => absent,
  }
}
