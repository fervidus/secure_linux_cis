#
class secure_linux_cis::distribution::ubuntu18::cis_2_1_9 {
  include secure_linux_cis::rules::ensure_tftp_server_is_not_enabled
}
