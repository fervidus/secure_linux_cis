#
class secure_linux_cis::cis_suse12::cis_2_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_time_services_are_not_enabled
}
