#
class secure_linux_cis::cis_ubuntu18::cis_5_2_12 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_idle_timeout_interval_is_configured
}
