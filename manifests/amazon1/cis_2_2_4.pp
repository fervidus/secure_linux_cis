#
class secure_linux_cis::cis_amazon1::cis_2_2_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_cups_is_not_enabled
}
