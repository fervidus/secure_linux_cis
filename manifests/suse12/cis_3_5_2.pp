#
class secure_linux_cis::cis_suse12::cis_3_5_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_sctp_is_disabled
}
