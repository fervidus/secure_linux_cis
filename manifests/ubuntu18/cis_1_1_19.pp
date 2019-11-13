#
class secure_linux_cis::cis_ubuntu18::cis_1_1_19 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nosuid_option_set_on_removable_media_partitions
}
