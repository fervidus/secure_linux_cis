#
class secure_linux_cis::oracle8::cis_3_1_2 {
  include secure_linux_cis::rules::ensure_packet_redirect_sending_is_disabled
}
