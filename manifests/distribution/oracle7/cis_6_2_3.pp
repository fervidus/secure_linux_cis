#
class secure_linux_cis::distribution::oracle7::cis_6_2_3 {
  include secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_shadow
}
