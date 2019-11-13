#
class secure_linux_cis::cis_ubuntu16::cis_5_2_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_ignorerhosts_is_enabled
}
