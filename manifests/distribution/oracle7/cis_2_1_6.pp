# @api private
#
class secure_linux_cis::distribution::oracle7::cis_2_1_6 {
  include secure_linux_cis::rules::ensure_tftp_server_is_not_enabled
}
