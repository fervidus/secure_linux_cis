# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_2_9 {
  include secure_linux_cis::rules::ensure_HTTP_server_is_not_enabled
}
