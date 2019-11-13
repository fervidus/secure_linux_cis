#
class secure_linux_cis::cis_amazon2::cis_5_2_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_protocol_is_set_to_2
}
