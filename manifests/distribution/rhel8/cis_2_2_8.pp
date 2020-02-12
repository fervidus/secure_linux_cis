# @api private
#
class secure_linux_cis::distribution::rhel8::cis_2_2_8 {
  include secure_linux_cis::rules::ensure_imap_and_pop3_server_is_not_enabled
}
