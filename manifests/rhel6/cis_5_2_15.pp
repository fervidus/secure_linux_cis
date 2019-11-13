#
class secure_linux_cis::cis_rhel6::cis_5_2_15 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_warning_banner_is_configured
}
