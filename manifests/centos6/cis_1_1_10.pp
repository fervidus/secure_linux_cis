#
class secure_linux_cis::cis_centos6::cis_1_1_10 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_noexec_option_set_on_var_tmp_partition
}
