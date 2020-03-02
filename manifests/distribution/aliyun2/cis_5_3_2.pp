# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_5_3_2 {
  include secure_linux_cis::rules::ensure_lockout_for_failed_password_attempts_is_configured
}
