#
class secure_linux_cis::cis_centos7::cis_6_2_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_group
}
