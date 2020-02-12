# @api private
#
class secure_linux_cis::distribution::centos7::cis_2_2_19 {
  include secure_linux_cis::rules::ensure_tftp_server_is_not_enabled
}
