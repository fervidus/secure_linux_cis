#
class secure_linux_cis::centos8::cis_2_2_1_2 {
  include secure_linux_cis::rules::ensure_chrony_is_configured
}
