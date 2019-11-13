#
class secure_linux_cis::cis_suse12::cis_1_1_1_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_mounting_of_udf_filesystems_is_disabled
}
