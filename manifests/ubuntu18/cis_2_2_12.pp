#
class secure_linux_cis::cis_ubuntu18::cis_2_2_12 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_samba_is_not_enabled
}
