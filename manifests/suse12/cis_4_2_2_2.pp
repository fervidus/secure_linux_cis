#
class secure_linux_cis::cis_suse12::cis_4_2_2_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_logging_is_configured
}
