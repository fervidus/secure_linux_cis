#
class secure_linux_cis::cis_amazon2::cis_1_1_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_mounting_of_jffs2_filesystems_is_disabled
}
