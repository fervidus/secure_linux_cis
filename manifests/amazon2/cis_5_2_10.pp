#
class secure_linux_cis::cis_amazon2::cis_5_2_10 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled
}
