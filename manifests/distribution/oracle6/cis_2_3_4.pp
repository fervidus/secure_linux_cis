# @api private
#
class secure_linux_cis::distribution::oracle6::cis_2_3_4 {
  include secure_linux_cis::rules::ensure_telnet_client_is_not_installed
}
