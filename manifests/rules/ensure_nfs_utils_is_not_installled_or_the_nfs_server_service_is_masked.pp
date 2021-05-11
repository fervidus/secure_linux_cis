# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nfs_is_not_enabled
class secure_linux_cis::rules::ensure_nfs_utils_is_not_installled_or_the_nfs_server_service_is_masked {
  package { 'nfs-utils':
    ensure => absent,
  }
}
