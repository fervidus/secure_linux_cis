#
class secure_linux_cis::cis_amazon1::cis_5_4_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_password_expiration_warning_days_is_7_or_more
}
