# @api private
#
# @summary Ensure nfs-utils is not installed or the nfs-server service is disabled 
#
class secure_linux_cis::rules::ensure_nfs_utils_is_not_installed_or_the_nfs_server_service_is_disabled {
  package { 'nfs-utils':
    ensure   => absent,
  }
}
