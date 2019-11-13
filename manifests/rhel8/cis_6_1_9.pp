#
class secure_linux_cis::cis_rhel8::cis_6_1_9 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_gshadow_are_configured
}
