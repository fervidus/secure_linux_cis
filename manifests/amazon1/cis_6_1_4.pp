#
class secure_linux_cis::cis_amazon1::cis_6_1_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_group_are_configured
}
