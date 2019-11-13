#
class secure_linux_cis::cis_oracle8::cis_1_7_1_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_motd_are_configured
}
