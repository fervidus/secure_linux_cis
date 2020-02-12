# @api private
#
class secure_linux_cis::distribution::centos6::cis_5_4_1_3 {
  include secure_linux_cis::rules::ensure_password_expiration_warning_days_is_7_or_more
}
