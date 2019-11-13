#
class secure_linux_cis::cis_ubuntu18::cis_5_4_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_password_expiration_is_365_days_or_less
}
