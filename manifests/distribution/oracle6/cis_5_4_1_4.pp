# @api private
#
class secure_linux_cis::distribution::oracle6::cis_5_4_1_4 {
  include secure_linux_cis::rules::ensure_inactive_password_lock_is_30_days_or_less
}
