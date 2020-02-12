# @api private
#
class secure_linux_cis::distribution::centos8::cis_2_2_10 {
  include secure_linux_cis::rules::ensure_FTP_Server_is_not_enabled
}
