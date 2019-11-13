#
class secure_linux_cis::cis_amazon1::cis_6_1_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_shadow_are_configured
}
