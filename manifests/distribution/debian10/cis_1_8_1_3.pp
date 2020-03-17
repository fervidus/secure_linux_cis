# @api private
#
class secure_linux_cis::distribution::debian10::cis_1_8_1_3 {
  include secure_linux_cis::rules::ensure_remote_login_warning_banner_is_configured_properly
}
