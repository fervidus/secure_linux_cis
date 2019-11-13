#
class secure_linux_cis::cis_ubuntu18::cis_5_4_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_minimum_days_between_password_changes_is_7_or_more
}
