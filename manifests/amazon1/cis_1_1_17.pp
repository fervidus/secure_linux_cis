#
class secure_linux_cis::amazon1::cis_1_1_17 {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_dev_shm_partition
}
