# @api private
#
class secure_linux_cis::distribution::rhel8::cis_2_3_2 {
  include secure_linux_cis::rules::ensure_telnet_client_is_not_installed
}
