# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nfs_utils_is_not_installed_or_the_nfs_server_service_is_disabled
class secure_linux_cis::rules::ensure_nfs_utils_is_not_installed_or_the_nfs_server_service_is_disabled {
  package { 'nfs-utils':
    ensure   => absent,
  }
}
