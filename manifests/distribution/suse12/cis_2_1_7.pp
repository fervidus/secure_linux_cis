# @api private
#
class secure_linux_cis::distribution::suse12::cis_2_1_7 {
  include secure_linux_cis::rules::ensure_talk_server_is_not_enabled
}
