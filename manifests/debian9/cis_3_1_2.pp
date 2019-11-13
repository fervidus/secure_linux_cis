#
class secure_linux_cis::cis_debian9::cis_3_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_packet_redirect_sending_is_disabled
}
