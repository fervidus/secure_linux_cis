# @api private
#
# @summary Ensure NFS is not installed 
#
class secure_linux_cis::rules::ensure_nfs_is_not_installed {
  package { 'nfs-kernel-server':
    ensure => absent,
  }
}
