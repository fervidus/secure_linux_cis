#
class secure_linux_cis::cis_debian8::cis_5_2_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_ssh_sshd_config_are_configured
}
