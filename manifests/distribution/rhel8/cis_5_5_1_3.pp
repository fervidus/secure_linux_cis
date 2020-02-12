# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_5_1_3 {
  include secure_linux_cis::rules::ensure_password_expiration_warning_days_is_7_or_more
}
