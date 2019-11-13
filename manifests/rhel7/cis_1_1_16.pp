#
class secure_linux_cis::cis_rhel7::cis_1_1_16 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nosuid_option_set_on_dev_shm_partition
}
