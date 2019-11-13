#
class secure_linux_cis::cis_debian8::cis_1_1_1_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_mounting_of_squashfs_filesystems_is_disabled
}
