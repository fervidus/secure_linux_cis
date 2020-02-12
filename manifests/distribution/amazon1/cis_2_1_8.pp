# @api private
#
class secure_linux_cis::distribution::amazon1::cis_2_1_8 {
  include secure_linux_cis::rules::ensure_telnet_server_is_not_enabled
}
