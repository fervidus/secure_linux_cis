#
class secure_linux_cis::cis_amazon2::cis_1_1_9 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nosuid_option_set_on_var_tmp_partition
}
