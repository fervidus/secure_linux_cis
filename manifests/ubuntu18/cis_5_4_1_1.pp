#
class secure_linux_cis::ubuntu18::cis_5_4_1_1 {
  include secure_linux_cis::rules::ensure_password_expiration_is_365_days_or_less
}
