#
class secure_linux_cis::cis_suse12::cis_1_5_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_core_dumps_are_restricted
}
