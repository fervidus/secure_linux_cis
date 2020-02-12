# @api private
#
class secure_linux_cis::distribution::centos7::cis_2_2_21 {
  include secure_linux_cis::rules::ensure_talk_server_is_not_enabled
}
