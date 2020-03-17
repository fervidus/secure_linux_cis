# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_2_1 {
  include secure_linux_cis::rules::ensure_packet_redirect_sending_is_disabled
}
