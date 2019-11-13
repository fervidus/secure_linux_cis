#
class secure_linux_cis::cis_centos7::cis_5_3_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_password_reuse_is_limited
}
