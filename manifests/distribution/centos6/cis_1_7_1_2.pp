# @api private
#
class secure_linux_cis::distribution::centos6::cis_1_7_1_2 {
  include secure_linux_cis::rules::ensure_local_login_warning_banner_is_configured_properly
}
