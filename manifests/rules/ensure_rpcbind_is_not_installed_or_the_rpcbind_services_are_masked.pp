# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nfs_is_not_enabled
class secure_linux_cis::rules::ensure_rpcbind_is_not_installed_or_the_rpcbind_services_are_masked {
  package { 'rpcbind':
    ensure => absent,
  }
}
