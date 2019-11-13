#
class secure_linux_cis::cis_oracle8::cis_6_1_10 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_world_writable_files_exist
}
