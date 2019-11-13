#
class secure_linux_cis::cis_centos7::cis_2_2_21 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_rsync_service_is_not_enabled
}
