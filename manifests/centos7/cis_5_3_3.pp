#
class secure_linux_cis::centos7::cis_5_3_3 {
  include secure_linux_cis::rules::ensure_password_reuse_is_limited
}