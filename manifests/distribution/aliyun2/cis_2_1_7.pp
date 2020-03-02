# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_2_1_7 {
  include secure_linux_cis::rules::ensure_nfs_and_rpc_are_not_enabled
}
