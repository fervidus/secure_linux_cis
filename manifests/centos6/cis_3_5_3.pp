#
class secure_linux_cis::cis_centos6::cis_3_5_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_rds_is_disabled
}
