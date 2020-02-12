# @api private
#
class secure_linux_cis::distribution::rhel7::cis_2_2_18 {
  include secure_linux_cis::rules::ensure_talk_server_is_not_enabled
}
