#
class secure_linux_cis::cis_centos6::cis_1_1_15 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nodev_option_set_on_dev_shm_partition
}
