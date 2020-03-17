# @api private
#
class secure_linux_cis::distribution::debian10::cis_2_2_10 {
  include secure_linux_cis::rules::ensure_http_server_is_not_enabled
}
