#
class secure_linux_cis::distribution::rhel8::cis_5_4_3 {
  include secure_linux_cis::rules::ensure_password_reuse_is_limited
}
