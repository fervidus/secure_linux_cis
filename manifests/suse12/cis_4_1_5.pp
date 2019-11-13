#
class secure_linux_cis::cis_suse12::cis_4_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected
}
