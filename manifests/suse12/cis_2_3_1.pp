#
class secure_linux_cis::cis_suse12::cis_2_3_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nis_client_is_not_installed
}
