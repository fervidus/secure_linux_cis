#
class secure_linux_cis::cis_amazon1::cis_1_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_noexec_option_set_on_tmp_partition
}
