# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_2_1_11 {
  include secure_linux_cis::rules::ensure_imap_and_pop3_server_is_not_enabled
}
