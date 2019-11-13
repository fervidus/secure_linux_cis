#
class secure_linux_cis::cis_amazon2::cis_6_2_17 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_duplicate_gids_exist
}
