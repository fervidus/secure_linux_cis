#
class secure_linux_cis::cis_ubuntu16::cis_5_2_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_x11_forwarding_is_disabled
}
