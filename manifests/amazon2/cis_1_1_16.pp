#
class secure_linux_cis::amazon2::cis_1_1_16 {
  include secure_linux_cis::rules::ensure_nosuid_option_set_on_dev_shm_partition
}
