# @api private
#
class secure_linux_cis::distribution::centos7::cis_2_2_18 {
  include secure_linux_cis::rules::ensure_telnet_server_is_not_enabled
}
