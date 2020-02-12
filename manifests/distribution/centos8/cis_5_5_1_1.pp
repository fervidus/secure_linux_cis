# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_5_1_1 {
  include secure_linux_cis::rules::ensure_password_expiration_is_365_days_or_less
}
