#
class secure_linux_cis::ubuntu18::cis_6_2_3 {
  include secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_shadow
}
