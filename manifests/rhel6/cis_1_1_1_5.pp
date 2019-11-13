#
class secure_linux_cis::cis_rhel6::cis_1_1_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_mounting_of_hfsplus_filesystems_is_disabled
}
