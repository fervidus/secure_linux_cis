# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_3_8 {
  include secure_linux_cis::rules::ensure_tcp_syn_cookies_is_enabled
}
