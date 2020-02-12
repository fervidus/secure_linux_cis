# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_2_8 {
  include secure_linux_cis::rules::ensure_TCP_SYN_Cookies_is_enabled
}
