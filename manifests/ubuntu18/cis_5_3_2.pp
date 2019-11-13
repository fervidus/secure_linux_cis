#
class secure_linux_cis::cis_ubuntu18::cis_5_3_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_lockout_for_failed_password_attempts_is_configured
}
