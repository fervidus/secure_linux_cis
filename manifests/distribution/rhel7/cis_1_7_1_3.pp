# @api private
#
class secure_linux_cis::distribution::rhel7::cis_1_7_1_3 {
  include secure_linux_cis::rules::ensure_remote_login_warning_banner_is_configured_properly
}
