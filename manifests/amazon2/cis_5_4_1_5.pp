#
class secure_linux_cis::cis_amazon2::cis_5_4_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_all_users_last_password_change_date_is_in_the_past
}
