#
class secure_linux_cis::ubuntu16::cis_6_2_2 {
  include secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_passwd
}
