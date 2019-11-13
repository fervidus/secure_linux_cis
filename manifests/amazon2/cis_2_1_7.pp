#
class secure_linux_cis::cis_amazon2::cis_2_1_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_xinetd_is_not_enabled
}
