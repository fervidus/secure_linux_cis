#
class secure_linux_cis::suse12::cis_6_2_3 {
  include secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_shadow
}
