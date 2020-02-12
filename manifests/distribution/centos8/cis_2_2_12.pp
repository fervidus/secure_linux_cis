# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_2_12 {
  include secure_linux_cis::rules::ensure_NFS_is_not_enabled
}
