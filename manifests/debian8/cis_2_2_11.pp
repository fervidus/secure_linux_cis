#
class secure_linux_cis::debian8::cis_2_2_11 {
  include secure_linux_cis::rules::ensure_imap_and_pop3_server_is_not_installed
}
