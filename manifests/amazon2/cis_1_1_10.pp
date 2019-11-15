#
class secure_linux_cis::amazon2::cis_1_1_10 {
  include secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition
}
