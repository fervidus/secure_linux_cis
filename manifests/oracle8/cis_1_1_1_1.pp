#
class secure_linux_cis::cis_oracle8::cis_1_1_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_mounting_of_cramfs_filesystems_is_disabled
}
