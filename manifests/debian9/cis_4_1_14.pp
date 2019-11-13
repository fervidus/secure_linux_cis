#
class secure_linux_cis::cis_debian9::cis_4_1_14 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_file_deletion_events_by_users_are_collected
}
