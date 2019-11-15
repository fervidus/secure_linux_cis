#
class secure_linux_cis::ubuntu18::cis_1_1_9 {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition
}
