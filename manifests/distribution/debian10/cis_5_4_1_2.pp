# @api private
#
class secure_linux_cis::distribution::debian10::cis_5_4_1_2 {
  include secure_linux_cis::rules::ensure_minimum_days_between_password_changes_is_7_or_more
}
