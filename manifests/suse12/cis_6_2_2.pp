#
class secure_linux_cis::cis_suse12::cis_6_2_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_passwd
}
