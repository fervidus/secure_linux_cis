#
class secure_linux_cis::cis_centos6::cis_1_1_18 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nodev_option_set_on_removable_media_partitions
}
