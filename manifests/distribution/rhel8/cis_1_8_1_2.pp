# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_8_1_2 {
  include secure_linux_cis::rules::ensure_local_login_warning_banner_is_configured_properly
}
