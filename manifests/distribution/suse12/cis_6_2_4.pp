# @api private
#
class secure_linux_cis::distribution::suse12::cis_6_2_4 {
  include secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_group
}
