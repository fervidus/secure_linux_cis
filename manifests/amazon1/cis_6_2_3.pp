#
class secure_linux_cis::cis_amazon1::cis_6_2_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_shadow
}
