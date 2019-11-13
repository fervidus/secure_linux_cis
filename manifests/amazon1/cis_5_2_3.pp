#
class secure_linux_cis::cis_amazon1::cis_5_2_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_loglevel_is_set_to_info
}
