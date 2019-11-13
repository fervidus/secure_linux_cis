#
class secure_linux_cis::cis_oracle7::cis_4_2_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_all_logfiles_are_configured
}
