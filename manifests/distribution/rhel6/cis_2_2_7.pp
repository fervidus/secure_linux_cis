# @api private
#
class secure_linux_cis::distribution::rhel6::cis_2_2_7 {
  include secure_linux_cis::rules::ensure_nfs_and_rpc_are_not_enabled
}
