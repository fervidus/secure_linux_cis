# @api private
#
class secure_linux_cis::distribution::suse12::cis_3_4_1 {
  include secure_linux_cis::rules::ensure_tcp_wrappers_is_installed
}
