#
class secure_linux_cis::cis_oracle6::cis_6_2_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_root_path_integrity
}
