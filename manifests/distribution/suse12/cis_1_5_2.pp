# @api private
#
class secure_linux_cis::distribution::suse12::cis_1_5_2 {
  include secure_linux_cis::rules::ensure_xd_nx_support_is_enabled
}
