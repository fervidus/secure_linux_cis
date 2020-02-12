# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_2_8 {
  include secure_linux_cis::rules::ensure_IMAP_and_POP3_server_is_not_enabled
}
