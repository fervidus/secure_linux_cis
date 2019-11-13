#
class secure_linux_cis::cis_amazon1::cis_1_6_1_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_unconfined_daemons_exist
}
