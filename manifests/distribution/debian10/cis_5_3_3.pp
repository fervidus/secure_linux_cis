# @api private
#
class secure_linux_cis::distribution::debian10::cis_5_3_3 {
  include secure_linux_cis::rules::ensure_password_reuse_is_limited
}
