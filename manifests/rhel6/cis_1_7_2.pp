#
class secure_linux_cis::cis_rhel6::cis_1_7_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_gdm_login_banner_is_configured
}
