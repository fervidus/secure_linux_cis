# @api private
#
class secure_linux_cis::distribution::rhel6::cis_3_2_8 {
  include secure_linux_cis::rules::ensure_tcp_syn_cookies_is_enabled
}
