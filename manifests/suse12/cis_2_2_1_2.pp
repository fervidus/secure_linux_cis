#
class secure_linux_cis::cis_suse12::cis_2_2_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ntp_is_configured
}
