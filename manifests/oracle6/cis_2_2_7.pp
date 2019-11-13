#
class secure_linux_cis::cis_oracle6::cis_2_2_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nfs_and_rpc_are_not_enabled
}
