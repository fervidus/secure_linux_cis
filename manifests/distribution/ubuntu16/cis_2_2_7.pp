#
class secure_linux_cis::distribution::ubuntu16::cis_2_2_7 {
  include secure_linux_cis::rules::ensure_nfs_and_rpc_are_not_enabled
}
