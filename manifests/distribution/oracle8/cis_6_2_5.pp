# @api private
#
class secure_linux_cis::distribution::oracle8::cis_6_2_5 {
  include secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_group
}
