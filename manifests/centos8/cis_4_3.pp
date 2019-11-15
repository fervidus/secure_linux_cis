#
class secure_linux_cis::centos8::cis_4_3 {
  include secure_linux_cis::rules::ensure_logrotate_is_configured
}
