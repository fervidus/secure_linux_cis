# @api private
#
class secure_linux_cis::distribution::centos8::cis_1_8_2 {
  include secure_linux_cis::rules::ensure_GDM_login_banner_is_configured
}
