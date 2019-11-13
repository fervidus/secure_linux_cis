#
class secure_linux_cis::cis_suse12::cis_5_1_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_at_cron_is_restricted_to_authorized_users
}
