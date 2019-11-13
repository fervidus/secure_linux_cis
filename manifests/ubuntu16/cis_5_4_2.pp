#
class secure_linux_cis::cis_ubuntu16::cis_5_4_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_system_accounts_are_non_login
}
